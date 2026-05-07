---
name: cicd-vault-implementation
description: "Implement approved CI/CD Vault integration changes such as OIDC/JWT auth, validation, masking, and removal of obsolete secret flows."
argument-hint: "[approved migration plan and CI/CD workflow files]"
---

# CI/CD Vault Implementation

## Applicability

Use when migration plan includes CI/CD changes or selected pattern includes OIDC/JWT for pipeline Vault access.

## Approved Changes

May update approved pipeline files for:

- OIDC/JWT auth placeholders
- Vault address and role placeholders
- validation steps
- masking/redaction checks
- deployment manifest validation
- removal of obsolete variables only when approved

## Do Not

- Do not add Vault tokens.
- Do not add secret values.
- Do not echo secrets or environment dumps.
- Do not remove existing CI/CD secret variables unless cutover and rollback plan approve removal.

## Implementation Guidance

- Prefer short-lived identity-based auth.
- Keep pipeline logs redacted.
- Add validation before deploy where possible.

