---
name: vault-test-automation
description: "Create test cases and validation automation for Vault integration."
agent: "Vault Test Automation Agent"
argument-hint: "[implementation plan or codebase path]"
---

Create Vault test cases and validation automation for:

`${input:vault_target:Implementation plan, discovery document, or target codebase path}`

Produce or update:

- `docs/vault/<app-name>.test-cases.md`
- `scripts/vault/<app-name>-vault-validation.sh`
- `scripts/vault/<app-name>-vault-validation.ps1`

Cover success, denied access, missing secret, Vault unavailable, token expiry, rotation, redaction, rollback, and CI validation.
