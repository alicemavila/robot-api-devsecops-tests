# Robot Framework API Automation Project

Robust API test automation framework built with Robot Framework, Python, RequestsLibrary, Docker, Pabot, k6, OpenAPI, Schemathesis and GitHub Actions, following modern QA engineering and CI/CD best practices.

This project demonstrates a scalable API automation architecture with reusable components, centralized configurations, JSON Schema validation, API contract testing, negative API testing, Docker-based execution, parallel test execution, performance smoke testing, controlled rate limit validation, automated reporting and continuous integration workflows suitable for professional QA portfolios.

---

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-Testing-red)
![Python](https://img.shields.io/badge/Python-3.12-blue)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![Pabot](https://img.shields.io/badge/Parallel-Pabot-green)
![k6](https://img.shields.io/badge/Performance-k6-purple)
![OpenAPI](https://img.shields.io/badge/Contract-OpenAPI-green)
![Schemathesis](https://img.shields.io/badge/Contract%20Testing-Schemathesis-blueviolet)
![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-black)
![Allure Report](https://img.shields.io/badge/Reports-Allure-purple)

---

# Features

* Automated REST API validation
* Modular and scalable project architecture
* Reusable Robot Framework keywords
* Centralized payload and endpoint management
* Centralized API endpoint configuration
* Environment-based configuration
* Multi-environment execution support
* JSON Schema response validation
* OpenAPI contract definition
* API contract testing with Schemathesis
* Positive and negative API test scenarios
* Negative API testing with invalid payloads
* Smoke and regression execution strategy
* API key authorization validation
* Security-oriented API validations
* Parallel test execution with Pabot
* Performance smoke testing with k6
* Controlled rate limit smoke validation with k6
* Docker-based test execution
* Containerized execution with Robot Framework and Allure Report
* CI/CD pipeline with GitHub Actions
* Dedicated API test workflow with GitHub Actions
* Dedicated contract test workflow with GitHub Actions
* Dedicated performance test workflow with GitHub Actions
* Manual rate limit smoke workflow with GitHub Actions
* Allure Report integration
* Automated report publishing with GitHub Pages
* Artifact generation and storage through GitHub Actions
* Generated reports excluded from version control
* Generated HTML reports excluded from GitHub language statistics
* Clean and maintainable test structure
* Robot Framework LSP configuration with `robot.toml`

---

# Technologies Used

| Technology      | Purpose                                                 |
| --------------- | ------------------------------------------------------- |
| Robot Framework | Test automation framework                               |
| Python          | Support libraries, custom validators and configurations |
| RequestsLibrary | API requests and validations                            |
| JSON Schema     | API response schema validation                          |
| OpenAPI         | API contract definition                                 |
| Schemathesis    | API contract testing based on OpenAPI                   |
| Pabot           | Parallel Robot Framework test execution                 |
| Docker          | Containerized and reproducible test execution           |
| k6              | Performance and controlled rate limit smoke testing     |
| GitHub Actions  | Continuous Integration                                  |
| Allure Report   | Advanced test reporting                                 |
| GitHub Pages    | Published test report hosting                           |
| ReqRes API      | Public API used as test environment                     |
| dotenv          | Environment variable management                         |

---

# Project Structure

```bash
robot-api-devsecops-tests/
│
├── .github/
│   └── workflows/
│       ├── api-tests.yml
│       ├── contract-tests.yml
│       ├── performance-tests.yml
│       └── rate-limit-smoke.yml
│
├── .vscode/
│
├── assets/
│   └── allure-report.png
│
├── contract/
│   └── openapi.yaml
│
├── performance/
│   ├── rate-limit-smoke.js
│   └── reqres-smoke-performance.js
│
├── resources/
│   ├── config/
│   │   ├── endpoints.py
│   │   └── variables.py
│   │
│   ├── libraries/
│   │   └── schema_validator.py
│   │
│   ├── payloads/
│   │   └── user_payloads.py
│   │
│   ├── schemas/
│   │   ├── create_user_schema.json
│   │   ├── error_response_schema.json
│   │   ├── login_success_schema.json
│   │   ├── update_user_schema.json
│   │   ├── user_schema.json
│   │   └── users_list_schema.json
│   │
│   └── keywords.robot
│
├── tests/
│   ├── auth_test.robot
│   ├── negative_test.robot
│   ├── security_test.robot
│   └── users_test.robot
│
├── .dockerignore
├── .env.example
├── .gitattributes
├── .gitignore
├── Dockerfile
├── README.md
├── requirements.txt
├── robot.toml
├── run_tests.bat
└── schemathesis.toml
```

> Test reports and execution outputs are generated locally, through Docker or by GitHub Actions and should not be committed to the repository.

Generated files and folders such as the examples below are ignored by Git:

```bash
reports/
output/
allure-results/
allure-report/
pabot_results/
.pabotsuitenames
log.html
report.html
output.xml
schema-coverage.html
.hypothesis/
.env
```

The `.gitattributes` file is used to mark generated reports as generated files, preventing generated HTML reports from affecting GitHub language statistics.

---

# Test Coverage

## Authentication Tests

* Validate successful login
* Validate login without password
* Validate successful login response schema
* Validate error response schema for authentication errors

## Security Tests

* Validate request without API key
* Validate request with invalid API key
* Validate API key authorization behavior
* Validate security headers

## User API Tests

* Validate get existing user
* Validate get users list
* Validate non-existing user
* Validate user creation
* Validate user update
* Validate user deletion
* Validate response structure

## Schema Validation Tests

* Validate existing user response schema
* Validate users list response schema
* Validate created user response schema
* Validate updated user response schema
* Validate successful login response schema
* Validate error response schema

## Negative Payload Tests

* Validate login without email
* Validate login with empty payload
* Validate register without password
* Validate register with empty payload

## API Contract Tests

* Validate the OpenAPI contract using Schemathesis
* Validate documented API operations
* Validate expected response schemas and status codes
* Execute controlled positive example-based contract tests
* Avoid aggressive fuzzing or heavy traffic against the public API

The current API contract covers the following operations:

```text
GET    /users
GET    /users/{id}
POST   /users
PUT    /users/{id}
DELETE /users/{id}
POST   /login
POST   /register
```

Expected contract test result:

```text
7 operations selected
7 examples generated
7 examples passed
No issues found
```

## Performance Smoke Tests

* Validate API availability under lightweight load
* Validate HTTP status code
* Validate response time threshold
* Validate response body content
* Validate request failure rate threshold
* Validate 95th percentile response time threshold

## Controlled Rate Limit Smoke Tests

* Validate small controlled request bursts
* Validate that the API does not return server errors
* Validate response time under a controlled threshold
* Validate successful `200` responses
* Accept explicit `429 Too Many Requests` responses as controlled rate limit behavior when returned
* Avoid aggressive traffic against the public API

Expected controlled rate limit smoke result:

```text
checks_succeeded.....: 100.00%
checks_failed........: 0.00%
http_req_failed......: 0.00%
server_errors........: 0
successful_responses.: 10
```

---

# Local Setup

## 1. Clone Repository

```bash
git clone https://github.com/alicemavila/robot-api-devsecops-tests.git
cd robot-api-devsecops-tests
```

---

## 2. Create Virtual Environment

```bash
python -m venv venv
```

---

## 3. Activate Virtual Environment

### Windows CMD

```bash
venv\Scripts\activate
```

### Windows PowerShell

```powershell
.\venv\Scripts\Activate.ps1
```

### Linux / Mac

```bash
source venv/bin/activate
```

---

## 4. Install Dependencies

```bash
pip install -r requirements.txt
```

---

# Environment Configuration

Create a `.env` file in the project root directory based on the `.env.example` file.

## `.env.example`

```env
ENVIRONMENT=dev
BASE_URL=https://reqres.in/api
API_KEY=your_reqres_api_key_here
DEFAULT_TIMEOUT=30
VERIFY_SSL=True
```

## Local `.env`

```env
ENVIRONMENT=dev
BASE_URL=https://reqres.in/api
API_KEY=your_reqres_api_key_here
DEFAULT_TIMEOUT=30
VERIFY_SSL=True
```

> Never commit the `.env` file because it may contain sensitive information such as API keys, tokens or credentials.

---

# Multi-Environment Support

This project supports environment-based configuration through the `ENVIRONMENT` variable.

Available environment examples:

```env
ENVIRONMENT=dev
ENVIRONMENT=hml
ENVIRONMENT=prod
ENVIRONMENT=ci
```

The environment configuration is managed in:

```bash
resources/config/variables.py
```

Endpoint configuration is managed in:

```bash
resources/config/endpoints.py
```

The default environment is:

```env
ENVIRONMENT=dev
```

In CI/CD, the environment is configured as:

```env
ENVIRONMENT=ci
```

---

# Running Robot Framework Tests

## Execute Complete Test Suite

```bash
robot -d reports tests/
```

---

## Execute Smoke Tests

```bash
robot -i smoke -d reports tests/
```

---

## Execute Regression Tests

```bash
robot -i regression -d reports tests/
```

---

## Execute Negative Tests

```bash
robot -i negative -d reports tests/
```

---

## Execute Security Tests

```bash
robot -i security -d reports tests/
```

---

## Execute Tests Using Windows Batch File

```bash
run_tests.bat
```

---

# Parallel Execution with Pabot

This project supports parallel test execution using Pabot.

Pabot allows Robot Framework suites to run in parallel, reducing execution time and improving CI/CD efficiency.

## Run Tests in Parallel

```bash
pabot --processes 3 --outputdir reports tests/
```

---

## Run Tests in Parallel with Allure Results

```bash
pabot --processes 3 --listener "allure_robotframework;reports/allure-results" --outputdir reports tests/
```

---

## Recommended Parallel Execution Strategy

For this project, the recommended strategy is to run tests in parallel by suite:

```bash
pabot --processes 3 --listener "allure_robotframework;reports/allure-results" --outputdir reports tests/
```

This avoids unnecessary conflicts between test cases and keeps execution stable.

---

# Docker Execution

This project supports containerized test execution using Docker.

Docker execution allows the test suite to run in a standardized environment, reducing local setup issues related to Python, dependencies, Java and Allure CLI.

## Build Docker Image

```bash
docker build -t robot-api-devsecops-tests .
```

---

## Run Tests with Docker

### Windows PowerShell

```powershell
docker run --rm --env-file .env -v "${PWD}/reports:/app/reports" robot-api-devsecops-tests
```

### Windows CMD

```bash
docker run --rm --env-file .env -v "%cd%/reports:/app/reports" robot-api-devsecops-tests
```

### Linux / Mac

```bash
docker run --rm --env-file .env -v "$(pwd)/reports:/app/reports" robot-api-devsecops-tests
```

The Docker execution runs the full Robot Framework test suite and generates Robot Framework reports and Allure report files inside the `reports` directory.

---

## Docker Reports

After running the tests with Docker, the generated reports will be available in:

```bash
reports/
```

Main report files:

```bash
reports/output.xml
reports/log.html
reports/report.html
reports/allure-results/
reports/allure-report/
```

To serve the generated Allure report locally without using Allure CLI, run:

```bash
python -m http.server 8080 --directory reports/allure-report
```

Then access:

```text
http://localhost:8080
```

---

# API Contract Testing with OpenAPI and Schemathesis

This project includes API contract testing using an OpenAPI 3.0 contract and Schemathesis.

The OpenAPI contract defines the expected API operations, request bodies, response structures and status codes.

Contract file:

```bash
contract/openapi.yaml
```

Schemathesis uses this contract to automatically execute controlled contract tests and validate that the API behavior is aligned with the documented specification.

Schemathesis configuration file:

```bash
schemathesis.toml
```

The current API contract covers the following operations:

```text
GET    /users
GET    /users/{id}
POST   /users
PUT    /users/{id}
DELETE /users/{id}
POST   /login
POST   /register
```

The contract testing configuration uses:

* Positive example-based execution
* API key header authentication
* User-Agent header for public API compatibility
* Disabled heavy fuzzing against the public API
* Disabled stateful testing against the public API
* Controlled execution suitable for CI/CD and portfolio demonstration

## Run Contract Tests with Docker

```bash
docker run --rm --env-file .env robot-api-devsecops-tests schemathesis run contract/openapi.yaml --url https://reqres.in/api
```

## Run Contract Tests Locally

```bash
schemathesis run contract/openapi.yaml --url https://reqres.in/api
```

## Expected Schemathesis Result

```text
Loaded specification from contract/openapi.yaml
Operations: 7 selected / 7 total
Examples: 7 passed
Coverage: disabled
Fuzzing: disabled
Stateful: disabled
No issues found
```

> A valid ReqRes API key is required to run the contract tests successfully.
>
> Do not hardcode the API key in the OpenAPI file or in the Schemathesis configuration. Use `.env` locally and GitHub Secrets in CI/CD.

---

# Allure Report

## Generate Allure Results

### Windows PowerShell

```powershell
robot --listener "allure_robotframework;reports/allure-results" --outputdir reports tests/
```

### Windows CMD

```bash
robot ^
--listener "allure_robotframework;reports/allure-results" ^
--outputdir reports ^
tests/
```

### Linux / Mac

```bash
robot \
--listener "allure_robotframework;reports/allure-results" \
--outputdir reports \
tests/
```

---

## Generate Allure Results with Parallel Execution

```bash
pabot --processes 3 --listener "allure_robotframework;reports/allure-results" --outputdir reports tests/
```

---

## Generate Allure Report

```bash
allure generate reports/allure-results -o reports/allure-report --clean
```

---

## Open Allure Report

```bash
allure open reports/allure-report
```

---

## Serve Allure Report

```bash
allure serve reports/allure-results
```

> Allure CLI and Java must be installed locally to generate and open the Allure report on your machine.
>
> If you do not want to install Allure CLI locally, use the Docker execution instead.

---

# Performance Testing with k6

This project includes lightweight performance smoke testing using k6.

The goal of these tests is not to generate heavy load against a public API. Instead, they validate basic performance expectations and controlled rate limit behavior in a responsible way for QA portfolio purposes.

Performance test files:

```bash
performance/reqres-smoke-performance.js
performance/rate-limit-smoke.js
```

## Performance Test Validations

The k6 performance smoke test validates:

* HTTP status code is 200
* Response time is acceptable
* Response body contains user data
* Request failure rate stays below the configured threshold
* 95th percentile response time stays below the configured threshold

## Controlled Rate Limit Test Validations

The controlled rate limit smoke test validates:

* Small controlled request bursts
* No server errors
* Response time below the configured threshold
* Successful `200` responses
* Explicit `429` responses when the API applies rate limiting
* Responsible execution without stressing the public API

---

## Run Performance Test with Docker

### Windows PowerShell

```powershell
docker run --rm -i -v ${PWD}:/app -w /app -e BASE_URL="https://reqres.in/api" -e "API_KEY=$env:API_KEY" grafana/k6 run performance/reqres-smoke-performance.js
```

### Windows CMD

```bash
docker run --rm -i -v %cd%:/app -w /app -e BASE_URL="https://reqres.in/api" -e API_KEY=%API_KEY% grafana/k6 run performance/reqres-smoke-performance.js
```

### Linux / Mac

```bash
docker run --rm -i -v "$(pwd)":/app -w /app -e BASE_URL="https://reqres.in/api" -e API_KEY="$API_KEY" grafana/k6 run performance/reqres-smoke-performance.js
```

---

## Run Controlled Rate Limit Smoke Test with Docker

### Windows PowerShell

```powershell
docker run --rm --env-file .env -i -v ${PWD}:/app -w /app grafana/k6 run performance/rate-limit-smoke.js
```

### Windows CMD

```bash
docker run --rm --env-file .env -i -v %cd%:/app -w /app grafana/k6 run performance/rate-limit-smoke.js
```

### Linux / Mac

```bash
docker run --rm --env-file .env -i -v "$(pwd)":/app -w /app grafana/k6 run performance/rate-limit-smoke.js
```

---

## Run a Single k6 Iteration for Debugging

### Windows PowerShell

```powershell
docker run --rm -i -v ${PWD}:/app -w /app -e BASE_URL="https://reqres.in/api" -e "API_KEY=$env:API_KEY" grafana/k6 run --vus 1 --iterations 1 performance/reqres-smoke-performance.js
```

---

## Expected k6 Performance Result

```text
checks_succeeded.....: 100.00%
checks_failed........: 0.00%
http_req_failed......: 0.00%
status is 200........: passed
response time is acceptable
response contains user data
```

Example validated result:

```text
checks_succeeded.....: 100.00%
checks_failed........: 0.00%
http_req_failed......: 0.00%
http_req_duration....: p(95)=599.85ms
```

## Expected Controlled Rate Limit Result

```text
checks_succeeded.....: 100.00%
checks_failed........: 0.00%
http_req_failed......: 0.00%
server_errors........: 0
successful_responses.: 10
```

> A valid ReqRes API key is required to run the performance and rate limit smoke tests successfully.
>
> Do not hardcode the API key in the test files. Use environment variables locally and GitHub Secrets in CI/CD.

---

# Live Reports

## GitHub Pages

Access the published Allure Report:

```text
https://alicemavila.github.io/robot-api-devsecops-tests/
```

---

# CI/CD Pipeline

This project uses GitHub Actions for automated execution and reporting.

## API Test Pipeline

The API test pipeline includes:

* Repository checkout
* Python setup
* Dependency installation
* Environment variable creation
* Automated Robot Framework execution
* Allure results generation
* Allure report generation
* Robot Framework report artifact upload
* Allure report artifact upload
* GitHub Pages deployment

Workflow file:

```bash
.github/workflows/api-tests.yml
```

---

## Contract Test Pipeline

The contract test pipeline includes:

* Repository checkout
* API key secret validation
* Docker image build
* Schemathesis contract test execution
* OpenAPI contract validation using controlled positive examples

Workflow file:

```bash
.github/workflows/contract-tests.yml
```

---

## Performance Test Pipeline

The performance test pipeline includes:

* Repository checkout
* k6 setup
* Execution of the k6 smoke performance test
* Validation of performance thresholds

Workflow file:

```bash
.github/workflows/performance-tests.yml
```

---

## Rate Limit Smoke Pipeline

The rate limit smoke pipeline includes:

* Repository checkout
* Required secret validation
* Controlled k6 rate limit smoke execution
* Validation that no server errors are returned
* Validation of successful or explicitly rate-limited responses

This workflow is intentionally configured for manual execution to avoid unnecessary traffic against the public API.

Workflow file:

```bash
.github/workflows/rate-limit-smoke.yml
```

---

# GitHub Secrets

The following secrets should be configured in GitHub Actions:

| Secret   | Description                                                  |
| -------- | ------------------------------------------------------------ |
| BASE_URL | Base API URL used during CI execution                        |
| API_KEY  | API key used to authenticate requests against the ReqRes API |

Recommended values:

```text
BASE_URL=https://reqres.in/api
API_KEY=your_reqres_api_key_here
```

To configure them:

1. Go to the GitHub repository
2. Click on **Settings**
3. Go to **Secrets and variables**
4. Click on **Actions**
5. Create the required repository secrets

---

# JSON Schema Validation

This project validates API response contracts using JSON Schema.

Schemas are stored in:

```bash
resources/schemas/
```

The custom validation library is stored in:

```bash
resources/libraries/schema_validator.py
```

Schema validation helps ensure that API responses follow the expected structure, required fields and data types.

---

# Robot Framework LSP Configuration

This project includes a `robot.toml` file to improve Robot Framework Language Server support in editors such as VSCode.

The configuration helps the editor resolve Python variable files and avoid false-positive warnings for variables loaded from:

```bash
resources/config/variables.py
resources/config/endpoints.py
```

---

# Implemented Improvements

* Docker support
* JSON Schema validation
* OpenAPI contract definition
* API contract testing with Schemathesis
* Expanded contract coverage for 7 API operations
* Dedicated contract testing workflow with GitHub Actions
* Controlled example-based contract test execution
* Parallel execution with Pabot
* Performance smoke testing with k6
* Controlled rate limit smoke validation without stressing the public API
* Manual rate limit smoke workflow with GitHub Actions
* Dedicated API test workflow with GitHub Actions
* Dedicated performance test workflow with GitHub Actions
* API key authorization validation
* Security-oriented API validation
* Robot Framework LSP configuration with `robot.toml`
* Generated reports removed from version control
* Generated HTML reports excluded from GitHub language statistics
* Environment configuration through `.env` and GitHub Secrets

---

# Best Practices Applied

* Modular architecture
* Separation of concerns
* Reusable keywords
* Centralized configurations
* Centralized endpoint management
* Centralized payload management
* Centralized schema management
* Environment isolation
* Multi-environment support
* Sensitive data protection with `.env` and GitHub Secrets
* JSON Schema validation
* OpenAPI contract testing
* Positive and negative test coverage
* Security-oriented API validations
* Parallel execution strategy
* Lightweight performance smoke testing
* Controlled rate limit smoke validation
* Docker-based execution
* Reproducible test environment with containers
* CI/CD automation
* Dedicated API, contract, performance and rate limit pipelines
* Tagging strategy
* Scalable framework structure
* Automated reporting
* Clean code principles
* Maintainable test design
* Generated reports excluded from version control
* Generated files excluded from GitHub language statistics
* Editor/LSP configuration for improved maintainability

---

# Important Notes

This project uses the public ReqRes API as a test environment.

Because it depends on a public API, responses and availability may vary depending on the service status, authentication rules or usage limits.

A valid ReqRes API key is required for authenticated requests.

The goal of this project is to demonstrate API test automation practices, project organization, schema validation, contract testing, negative testing, Docker-based execution, parallel execution, CI/CD integration, performance smoke testing, controlled rate limit validation and reporting strategy for QA portfolio purposes.

This project does not perform heavy load testing against the public API. The k6 scenarios are intentionally lightweight and designed as smoke performance validations.

This project does not perform aggressive fuzzing, stateful testing or rate limit stress testing against the public API. Contract tests are configured to run controlled positive examples, and the rate limit smoke test is configured as a controlled and responsible validation.

Database validation and role-based authorization validation require a controlled API and database environment. They are intentionally not forced into this public API project.

---

# Future Improvements / Out of Scope for Public API

* Expand API contract testing with advanced controlled scenarios using a private or local API environment
* Implement role-based authorization tests in a dedicated API project with user roles and permissions
* Implement database validation in a future local API project using a controlled database environment


---

# Screenshots

## Allure Report

<img width="100%" alt="Allure Report" src="https://raw.githubusercontent.com/alicemavila/robot-api-devsecops-tests/main/assets/allure-report.png">

---

# Author

## Alice Monteiro

QA Engineer focused on:

* Test Automation
* API Testing
* Robot Framework
* Docker-based Test Execution
* Contract Testing
* Performance Testing
* CI/CD Pipelines
* Software Quality Engineering

GitHub:

```text
https://github.com/alicemavila
```

LinkedIn:

```text
https://www.linkedin.com/in/alice-m-223157119/
```
