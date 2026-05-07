---
name: vault-sdk-test-skill
description: "Define and run safe validation for Vault SDK or direct API integration, including auth, token lifecycle, fetch, cache, and failure behavior."
argument-hint: "[migration plan, implementation summary, source diff]"
---

# Vault SDK Test Skill

## Applicability

Use when selected pattern includes SDK integration or direct Vault API integration.

## Test Focus

- startup auth behavior
- token/login flow
- secret fetch path with placeholders
- cache behavior
- lease renewal or token expiration handling
- Vault unavailable behavior
- permission denied and missing key behavior
- redacted logging

## Safe Automated Checks

- unit tests for secret client wrapper
- mocked Vault client tests
- build tests (`mvn test`, `gradle test`, `npm test`, `dotnet test`, `pytest`) when safe
- search for unsafe logging of returned secrets

## Manual Validation Required

- [ ] Lower-environment Vault auth succeeds.
- [ ] Secret fetch succeeds with approved path.
- [ ] Token expiration/renewal behavior is validated.
- [ ] Vault outage behavior is acceptable.

