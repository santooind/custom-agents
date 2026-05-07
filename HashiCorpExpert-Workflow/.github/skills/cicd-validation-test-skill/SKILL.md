---
name: cicd-validation-test-skill
description: "Validate CI/CD Vault migration changes, OIDC/JWT assumptions, masking, and deployment pipeline safety."
argument-hint: "[migration plan, implementation summary, CI/CD diff]"
---

# CI/CD Validation Test Skill

## Applicability

Use when CI/CD files changed or the selected pattern includes OIDC/JWT for pipeline access.

## Test Focus

- no long-lived Vault token committed
- OIDC/JWT role placeholders are safe
- no `printenv`, `set -x`, or secret echo patterns added
- deployment validation steps exist
- obsolete variables are not removed before rollback approval

## Safe Automated Checks

- workflow syntax checks when available
- redaction scan
- implementation safety scan

## Manual Validation Required

- [ ] Pipeline obtains short-lived Vault token in lower environment.
- [ ] Logs are masked.
- [ ] Deployment validation runs before promotion.

