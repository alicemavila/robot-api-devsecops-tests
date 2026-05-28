# Robot Framework API Automation Project

Robust API test automation framework built with Robot Framework, Python, RequestsLibrary and GitHub Actions, following modern QA engineering and CI/CD best practices.

This project demonstrates scalable API automation architecture, reusable components, centralized configurations, automated reporting and continuous integration workflows suitable for professional QA portfolios.

---

# Features

- Automated REST API validation
- Modular and scalable project architecture
- Reusable Robot Framework keywords
- Centralized payload and endpoint management
- Environment-based configuration
- Smoke and regression execution strategy
- CI/CD pipeline with GitHub Actions
- Allure Report integration
- Automated report publishing with GitHub Pages
- Artifact generation and storage
- Clean and maintainable test structure

---

# Technologies Used

| Technology | Purpose |
|---|---|
| Robot Framework | Test automation framework |
| Python | Support libraries and configurations |
| RequestsLibrary | API requests and validations |
| GitHub Actions | Continuous Integration |
| Allure Report | Advanced test reporting |
| ReqRes API | Test API environment |
| dotenv | Environment variable management |

---

# Project Structure

```bash
robot-api-devsecops-tests/
│
├── .github/
│   └── workflows/
│       └── api-tests.yml
│
├── resources/
│   ├── config/
│   │   ├── endpoints.py
│   │   └── variables.py
│   │
│   ├── payloads/
│   │   └── user_payloads.py
│   │
│   └── keywords.robot
│
├── tests/
│   ├── auth_test.robot
│   ├── security_test.robot
│   └── users_test.robot
│
├── reports/
│   ├── allure-results/
│   ├── allure-report/
│   ├── log.html
│   ├── output.xml
│   └── report.html
│
├── output/
│
├── .env
├── .env.example
├── .gitignore
├── requirements.txt
├── run_tests.bat
└── README.md
```

---

# Test Coverage

## Authentication Tests

- Validate successful login
- Validate login without password

## Security Tests

- Validate request without API key
- Validate request with invalid API key
- Validate security headers

## User API Tests

- Validate get existing user
- Validate get users list
- Validate non-existing user
- Validate user creation
- Validate user update
- Validate user deletion
- Validate response structure

---

# Local Setup

## Clone Repository

```bash
git clone https://github.com/alicemavila/robot-api-devsecops-tests.git
cd robot-api-devsecops-tests
```

---

## Install Dependencies

```bash
pip install -r requirements.txt
```

---

# Environment Configuration

Create a `.env` file in the project root directory:

```env
BASE_URL=https://reqres.in/api
API_KEY=YOUR_API_KEY
DEFAULT_TIMEOUT=30
VERIFY_SSL=True
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

# Allure Report

## Generate Allure Results

```bash
robot ^
--listener "allure_robotframework;reports/allure-results" ^
--outputdir reports ^
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

# CI/CD Pipeline

This project uses GitHub Actions for automated execution and reporting.

Pipeline execution includes:

- Repository checkout
- Python setup
- Dependency installation
- Environment variable creation
- Automated Robot Framework execution
- Allure report generation
- Artifact upload
- GitHub Pages deployment

---

# GitHub Pages Report

The Allure report is automatically published after successful pipeline execution.

Access:

```text
https://alicemavila.github.io/robot-api-devsecops-tests/
```

---

# Best Practices Applied

- Modular architecture
- Separation of concerns
- Reusable keywords
- Centralized configurations
- Centralized payload management
- Environment isolation
- CI/CD automation
- Tagging strategy
- Scalable framework structure
- Automated reporting
- Clean code principles
- Maintainable test design

---

# Future Improvements

- API schema validation
- Performance testing integration
- Docker support
- Parallel execution
- Multi-environment execution
- API contract testing
- Database validation layer

---

# Author

## Alice Monteiro

QA Engineer focused on:

- Test Automation
- API Testing
- Robot Framework
- CI/CD Pipelines
- Software Quality Engineering

GitHub:
https://github.com/alicemavila