---
name: vault-risk-validation
description: "Convert Vault migration validation gaps into merge readiness and risk-based recommendation."
argument-hint: "[test results, blocked tests, affected flows]"
---

# Vault Risk Validation

## Applicability

Run for every Vault validation.

## Procedure

1. Review affected flows and their risk.
2. Review tests executed and evidence.
3. Review tests not executed and blocked tests.
4. Determine merge readiness:
   - Ready for PR review
   - Ready with manual validation
   - Not ready
5. Determine risk-based recommendation:
   - Low-risk merge
   - Merge after manual smoke test
   - Do not merge yet

## Guidance

Use `Ready for PR review` only when required local/static tests passed and no runtime-blocking manual validation is required before review.

Use `Ready with manual validation` when code/config is reviewable but lower-environment smoke, Vault auth, runtime startup, or rollback validation is still required.

Use `Not ready` when required tests fail, secret exposure is detected, selected pattern is inconsistent, or implementation inputs are missing.

