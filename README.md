# Robot Framework API Automation Project

API automation project built with Robot Framework, RequestsLibrary, Python and GitHub Actions.

This project demonstrates API test automation best practices using:

- Robot Framework
- RequestsLibrary
- Environment variables
- CI/CD with GitHub Actions
- Modular architecture
- Payload separation
- Reusable keywords
- API validation strategies

---

# Technologies

- Robot Framework
- Python
- RequestsLibrary
- GitHub Actions
- ReqRes API

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
│   ├── payloads/
│   │   └── user_payloads.py
│   │
│   ├── config/
│   │   ├── endpoints.py
│   │   └── variables.py
│   │
│   └── keywords.robot
│
├── tests/
│   └── users_test.robot
│
├── reports/
│
├── .env
├── .gitignore
├── requirements.txt
├── run_tests.bat
└── README.md
```

---

# Test Coverage

Implemented scenarios:

- Get existing user
- Get non-existing user
- Create user
- Update user
- Delete user

---

# Setup

## Clone repository

```bash
git clone <repository_url>
```

---

## Create virtual environment

```bash
python -m venv venv
```

---

## Activate virtual environment

### Windows

```bash
venv\Scripts\activate
```

### Linux/Mac

```bash
source venv/bin/activate
```

---

## Install dependencies

```bash
pip install -r requirements.txt
```

---

# Environment Variables

Create a `.env` file:

```env
BASE_URL=https://reqres.in/api
API_KEY=YOUR_API_KEY
```

---

# Run Tests

## Execute all tests

```bash
robot -d reports tests/
```

---

## Execute smoke tests

```bash
robot -i smoke -d reports tests/
```

---

## Execute regression tests

```bash
robot -i regression -d reports tests/
```

---

# Reports

After execution, Robot Framework generates:

- log.html
- report.html
- output.xml

inside the `reports/` folder.

---

# CI/CD

This project uses GitHub Actions to execute automated API tests on:

- Push
- Pull Requests

Pipeline includes:

- Dependency installation
- Automated execution
- Artifact upload

---

# Best Practices Applied

- Separation of concerns
- Reusable keywords
- Centralized payloads
- Centralized endpoints
- Environment variables
- CI/CD pipeline
- Tag strategy
- Scalable architecture
- Clean code practices

---

# Author

Alice Monteiro - QA Engineer 