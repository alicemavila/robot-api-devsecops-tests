# Robot Framework API Automation Project

Robust API test automation framework built with Robot Framework, Python, RequestsLibrary, Docker, Pabot, k6 and GitHub Actions, following modern QA engineering and CI/CD best practices.

This project demonstrates a scalable API automation architecture with reusable components, centralized configurations, JSON Schema validation, negative API testing, Docker-based execution, parallel test execution, performance smoke testing, automated reporting and continuous integration workflows suitable for professional QA portfolios.

---

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-Testing-red)
![Python](https://img.shields.io/badge/Python-3.12-blue)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![Pabot](https://img.shields.io/badge/Parallel-Pabot-green)
![k6](https://img.shields.io/badge/Performance-k6-purple)
![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-black)
![Allure Report](https://img.shields.io/badge/Reports-Allure-purple)

---

# Features

* Automated REST API validation
* Modular and scalable project architecture
* Reusable Robot Framework keywords
* Centralized payload and endpoint management
* Environment-based configuration
* Multi-environment execution support
* JSON Schema response validation
* Positive and negative API test scenarios
* Negative API testing with invalid payloads
* Smoke and regression execution strategy
* Parallel test execution with Pabot
* Performance smoke testing with k6
* Docker-based test execution
* Containerized execution with Robot Framework and Allure Report
* CI/CD pipeline with GitHub Actions
* Dedicated performance test workflow with GitHub Actions
* Allure Report integration
* Automated report publishing with GitHub Pages
* Artifact generation and storage through GitHub Actions
* Clean and maintainable test structure
* Security-oriented API validations
* Robot Framework LSP configuration with `robot.toml`

---

# Technologies Used

| Technology      | Purpose                                                 |
| --------------- | ------------------------------------------------------- |
| Robot Framework | Test automation framework                               |
| Python          | Support libraries, custom validators and configurations |
| RequestsLibrary | API requests and validations                            |
| JSON Schema     | API response contract validation                        |
| Pabot           | Parallel Robot Framework test execution                 |
| Docker          | Containerized and reproducible test execution           |
| k6              | Performance smoke testing                               |
| GitHub Actions  | Continuous Integration                                  |
| Allure Report   | Advanced test reporting                                 |
| ReqRes API      | Test API environment                                    |
| dotenv          | Environment variable management                         |

---

# Project Structure

```bash
robot-api-devsecops-tests/
│
├── .github/
│   └── workflows/
│       ├── api-tests.yml
│       └── performance-tests.yml
│
├── .vscode/
│
├── assets/
│   └── allure-report.png
│
├── performance/
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
├── .gitignore
├── Dockerfile
├── requirements.txt
├── robot.toml
├── run_tests.bat
└── README.md
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
.env
```

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

## Performance Smoke Tests

* Validate API availability under lightweight load
* Validate HTTP status code
* Validate response time threshold
* Validate response body content
* Validate request failure rate threshold

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

Expected execution result:

```text
15 tests, 15 passed, 0 failed
```

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

Expected execution result:

```text
15 tests, 15 passed, 0 failed
```

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

This project includes a lightweight performance smoke test using k6.

The goal of this test is not to generate heavy load against a public API. Instead, it validates basic performance expectations in a controlled and responsible way for QA portfolio purposes.

Performance test file:

```bash
performance/reqres-smoke-performance.js
```

## Performance Test Validations

The k6 test validates:

* HTTP status code is 200
* Response time is acceptable
* Response body contains user data
* Request failure rate stays below the configured threshold
* 95th percentile response time stays below the configured threshold

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

## Run a Single k6 Iteration for Debugging

```bash
docker run --rm -i -v ${PWD}:/app -w /app -e BASE_URL="https://reqres.in/api" -e "API_KEY=$env:API_KEY" grafana/k6 run --vus 1 --iterations 1 performance/reqres-smoke-performance.js
```

---

## Expected k6 Result

```text
checks_succeeded...: 100.00%
checks_failed......: 0.00%
http_req_failed....: 0.00%
status is 200......: passed
response time is acceptable
response contains user data
```

Example validated result:

```text
checks_succeeded...: 100.00%
checks_failed......: 0.00%
http_req_failed....: 0.00%
http_req_duration...: p(95)=599.85ms
```

> A valid ReqRes API key is required to run the performance test successfully.
>
> Do not hardcode the API key in the test file. Use environment variables locally and GitHub Secrets in CI/CD.

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
* Parallel execution with Pabot
* Performance smoke testing with k6
* Robot Framework LSP configuration with `robot.toml`
* Generated reports removed from version control
* Environment configuration through `.env` and GitHub Secrets

---

# Best Practices Applied

* Modular architecture
* Separation of concerns
* Reusable keywords
* Centralized configurations
* Centralized payload management
* Centralized schema management
* Environment isolation
* Multi-environment support
* Sensitive data protection with `.env` and GitHub Secrets
* JSON Schema validation
* Positive and negative test coverage
* Security-oriented API validations
* Parallel execution strategy
* Lightweight performance smoke testing
* Docker-based execution
* Reproducible test environment with containers
* CI/CD automation
* Dedicated API and performance pipelines
* Tagging strategy
* Scalable framework structure
* Automated reporting
* Clean code principles
* Maintainable test design
* Generated reports excluded from version control
* Editor/LSP configuration for improved maintainability

---

# Important Notes

This project uses the public ReqRes API as a test environment.

Because it depends on a public API, responses and availability may vary depending on the service status, authentication rules or usage limits.

A valid ReqRes API key is required for authenticated requests.

The goal of this project is to demonstrate API test automation practices, project organization, schema validation, negative testing, Docker-based execution, parallel execution, CI/CD integration, performance smoke testing and reporting strategy for QA portfolio purposes.

This project does not perform heavy load testing against the public API. The k6 scenario is intentionally lightweight and designed as a smoke performance validation.

---

# Future Improvements

* API contract testing
* Database validation layer
* Authorization validation by user role
* Rate limit validation

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
* Performance Testing
* CI/CD Pipelines
* Software Quality Engineering

GitHub:
https://github.com/alicemavila

LinkedIn:
https://www.linkedin.com/in/alice-m-223157119/
