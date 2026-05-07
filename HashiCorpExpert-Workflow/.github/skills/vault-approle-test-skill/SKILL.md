---
name: vault-approle-test-skill
description: "Define validation for AppRole-based Vault authentication without exposing RoleID or SecretID."
argument-hint: "[migration plan, implementation summary, startup config]"
---

# Vault AppRole Test Skill

## Applicability

Use when the selected auth method is AppRole.

## Test Focus

- RoleID and SecretID are not committed
- wrapped SecretID delivery process is documented
- Vault Agent/AppRole auth config uses placeholders
- startup wrapper handles missing credentials safely
- file permissions for rendered config are documented

## Manual Validation Required

- [ ] Wrapped SecretID delivery works in lower environment.
- [ ] SecretID is never logged.
- [ ] AppRole login succeeds.
- [ ] App starts with rendered config.
- [ ] Rollback to previous secret source succeeds.

