# Robot Framework API Automation Project

Robust API test automation framework built with Robot Framework, Python, RequestsLibrary and GitHub Actions, following modern QA engineering and CI/CD best practices.

This project demonstrates a scalable API automation architecture with reusable components, centralized configurations, JSON Schema validation, negative API testing, automated reporting and continuous integration workflows suitable for professional QA portfolios.

---

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-Testing-red)
![Python](https://img.shields.io/badge/Python-3.12-blue)
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
* CI/CD pipeline with GitHub Actions
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
│       └── api-tests.yml
│
├── assets/
│   └── allure-report.png
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
├── .env.example
├── .gitignore
├── requirements.txt
├── robot.toml
├── run_tests.bat
└── README.md
```

> Test reports and execution outputs are generated locally or by GitHub Actions and should not be committed to the repository.

Generated files and folders such as the examples below are ignored by Git:

```bash
reports/
output/
allure-results/
allure-report/
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

```bash
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
API_KEY=YOUR_API_KEY
DEFAULT_TIMEOUT=30
VERIFY_SSL=True
```

## Local `.env`

```env
ENVIRONMENT=dev
BASE_URL=https://reqres.in/api
API_KEY=YOUR_API_KEY
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

# Running Tests

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

Pipeline execution includes:

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
API_KEY=YOUR_API_KEY
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
* CI/CD automation
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

The goal of this project is to demonstrate API test automation practices, project organization, schema validation, negative testing, CI/CD integration and reporting strategy for QA portfolio purposes.

---

# Future Improvements

* Docker support
* Parallel execution
* Performance testing integration
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
* CI/CD Pipelines
* Software Quality Engineering

GitHub:
https://github.com/alicemavila

LinkedIn:
https://www.linkedin.com/in/alice-m-223157119/
