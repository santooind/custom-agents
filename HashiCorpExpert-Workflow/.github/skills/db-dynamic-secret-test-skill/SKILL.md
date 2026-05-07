---
name: db-dynamic-secret-test-skill
description: "Define validation for Vault dynamic database secrets, credential lease expiry, connection pool behavior, and rollback."
argument-hint: "[migration plan, implementation summary, datasource changes]"
---

# DB Dynamic Secret Test Skill

## Applicability

Use when dynamic database secrets are in scope.

## Test Focus

- datasource initialization
- credential lease TTL and renewal
- connection pool reconnect/eviction
- rotation under light traffic
- rollback to previous credential source
- no database credentials in logs

## Manual Validation Required

- [ ] Application connects using Vault-issued database credentials.
- [ ] Credential rotation or lease expiry is tested.
- [ ] Connection pool recovers or restart procedure is documented.
- [ ] Rollback credential source works.

