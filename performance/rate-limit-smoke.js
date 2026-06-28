import http from 'k6/http';
import { check, fail } from 'k6';
import { Counter } from 'k6/metrics';

export const successfulResponses = new Counter('successful_responses');
export const rateLimitResponses = new Counter('rate_limit_responses');
export const serverErrors = new Counter('server_errors');

export const options = {
  scenarios: {
    controlled_rate_limit_smoke: {
      executor: 'constant-arrival-rate',
      rate: 1,
      timeUnit: '1s',
      duration: '10s',
      preAllocatedVUs: 1,
      maxVUs: 2,
    },
  },
  thresholds: {
    checks: ['rate>0.95'],
    http_req_duration: ['p(95)<1500'],
    server_errors: ['count==0'],
  },
};

const BASE_URL = __ENV.BASE_URL || 'https://reqres.in/api';
const API_KEY = __ENV.API_KEY;

export default function () {
  if (!API_KEY) {
    fail('API_KEY environment variable is required');
  }

  const params = {
    headers: {
      'x-api-key': API_KEY,
      'User-Agent': 'Mozilla/5.0 QA-Automation-Portfolio',
    },
  };

  const response = http.get(`${BASE_URL}/users/2`, params);

  if (response.status === 200) {
    successfulResponses.add(1);
  }

  if (response.status === 429) {
    rateLimitResponses.add(1);
  }

  if (response.status >= 500) {
    serverErrors.add(1);
  }

  check(response, {
    'status is 200 or controlled 429': (res) =>
      res.status === 200 || res.status === 429,

    'no server error is returned': (res) =>
      res.status < 500,

    'response time is below 1500ms': (res) =>
      res.timings.duration < 1500,

    'response contains expected user data when status is 200': (res) => {
      if (res.status !== 200) {
        return true;
      }

      const body = res.json();
      return body.data && body.data.id === 2;
    },

    'rate limit response is explicit when status is 429': (res) => {
      if (res.status !== 429) {
        return true;
      }

      const body = String(res.body).toLowerCase();

      return (
        body.includes('rate') ||
        body.includes('limit') ||
        res.headers['Retry-After'] !== undefined ||
        res.headers['X-RateLimit-Limit'] !== undefined
      );
    },
  });

  sleep(1);
}