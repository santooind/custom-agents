---
name: vault-testing
description: "Create Vault test case documents and validation automation for local, CI, runtime, security, rotation, and rollback behavior."
argument-hint: "[implementation plan or target codebase path]"
---

# Vault Testing

Use this skill when creating test cases or scripts for Vault integration.

## Procedure

1. Map requirements from the discovery and implementation plan to test scenarios.
2. Cover success path, missing secret, denied policy, expired token, Vault unavailable, malformed response, rotation, redaction, rollback, and CI/CD auth.
3. Prefer tests that use a local dev Vault, mock Vault, or fixture provider instead of production secrets.
4. Ensure scripts fail closed and never print secret values.
5. Add stack-specific validation for application config loaders, deployment manifests, Terraform boundaries, and CI/CD auth.
6. Include manual evidence steps for audit events when automation cannot validate them safely.
7. Create validation scripts from `templates/vault-validation-script.sh` and `templates/vault-validation-script.ps1` when Windows support is needed.

Use [Vault test cases template](../../../templates/vault-test-cases.md).
