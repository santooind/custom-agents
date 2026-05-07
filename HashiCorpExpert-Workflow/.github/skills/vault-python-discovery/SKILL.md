---
name: vault-python-discovery
description: "Discover Python framework, configuration, environment variable, and secret provider patterns."
argument-hint: "[target repository path]"
---

# Vault Python Discovery

## Applicability

Run when repository evidence includes Python files, `requirements.txt`, `pyproject.toml`, Pipfile, Django, Flask, FastAPI, Celery, Airflow, or Python batch jobs.

## Scan Procedure

1. Identify framework and runtime from manifests and imports.
2. Detect configuration access:
   - `os.environ`
   - `os.getenv`
   - `python-dotenv`
   - Pydantic settings
   - Django settings
3. Detect providers:
   - `hvac`
   - `boto3` Secrets Manager
   - Azure Key Vault
   - GCP Secret Manager
4. Detect database usage:
   - SQLAlchemy
   - Django ORM
   - psycopg/mysql clients
5. Detect operational risks:
   - module import-time config loading
   - cached settings objects
   - worker processes requiring restart for rotation

## Output

Return findings with masked evidence and confidence.

