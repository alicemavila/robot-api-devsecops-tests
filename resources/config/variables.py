from dotenv import load_dotenv
import os

load_dotenv()

BASE_URL = os.getenv("BASE_URL")
API_KEY = os.getenv("API_KEY")

DEFAULT_TIMEOUT = int(os.getenv("DEFAULT_TIMEOUT", 30))
VERIFY_SSL = os.getenv("VERIFY_SSL", "True").lower() == "true"