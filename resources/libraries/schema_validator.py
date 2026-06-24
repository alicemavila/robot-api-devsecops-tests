import json
import os
from jsonschema import Draft7Validator


def validate_json_schema(response_body, schema_file):
    """
    Validates a JSON response body against a JSON Schema file.
    """

    resources_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    schema_path = os.path.join(resources_dir, "schemas", schema_file)

    with open(schema_path, "r", encoding="utf-8") as file:
        schema = json.load(file)

    validator = Draft7Validator(schema)
    errors = sorted(validator.iter_errors(response_body), key=lambda error: error.path)

    if errors:
        error_messages = []

        for error in errors:
            path = ".".join(str(item) for item in error.path)
            location = path if path else "root"
            error_messages.append(f"{location}: {error.message}")

        raise AssertionError(
            "JSON Schema validation failed:\n" + "\n".join(error_messages)
        )