---
name: architecture-security-review
description: "Review enterprise architecture for security, privacy, compliance, IAM, trust boundaries, secrets, encryption, audit, abuse cases, and data protection."
argument-hint: "[architecture draft]"
---

# Architecture Security Review

Use this skill for architectures involving users, roles, sensitive data, integrations, cloud/platform access, secrets, audit, compliance, or external trust boundaries.

## Procedure

1. Identify trust boundaries, sensitive assets, data classification, users, roles, and privileged operations.
2. Extract `SEC-###`, `PRIV-###`, and `AUD-###`.
3. Review authentication, authorization, encryption, secrets, logging, audit, retention, deletion, abuse cases, and compliance assumptions.
4. Redact secrets, tokens, credentials, and sensitive values.
5. Convert unknown regulated-data and access-control decisions into blocker questions.

**Why?** Security must shape architecture before implementation.
