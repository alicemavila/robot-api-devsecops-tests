from dotenv import load_dotenv
import os

load_dotenv()

ENVIRONMENT = os.getenv("ENVIRONMENT", "dev")

BASE_URL_BY_ENVIRONMENT = {
    "dev": "https://reqres.in/api",
    "hml": "https://reqres.in/api",
    "prod": "https://reqres.in/api",
    "ci": "https://reqres.in/api"
}

BASE_URL = os.getenv(
    "BASE_URL",
    BASE_URL_BY_ENVIRONMENT.get(ENVIRONMENT, BASE_URL_BY_ENVIRONMENT["dev"])
)

API_KEY = os.getenv("API_KEY", "")

DEFAULT_TIMEOUT = int(os.getenv("DEFAULT_TIMEOUT", "30"))

VERIFY_SSL = os.getenv("VERIFY_SSL", "True").lower() == "true"