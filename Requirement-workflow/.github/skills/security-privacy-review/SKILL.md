---
name: security-privacy-review
description: "Review enterprise requirements for authentication, authorization, privacy, compliance, audit, data protection, secrets, abuse cases, retention, consent, and sensitive data handling."
argument-hint: "[requirement draft]"
---

# Security Privacy Review

Use this skill when requirements touch users, roles, permissions, sensitive data, audit, compliance, integrations, external access, exports, or operational logs.

## Procedure

1. Identify data classification and sensitive data.
2. Extract `SEC-###`, `PRIV-###`, and `AUD-###` requirements.
3. Review authn, authz, least privilege, role/action/resource/condition rules, logging, audit, retention, deletion, consent, and abuse cases.
4. Redact secrets, tokens, credentials, keys, and sensitive values.
5. Convert missing compliance or privacy decisions into blocker questions.
6. Link controls to affected requirements and acceptance criteria.

## Output

Write or update:

- `requirements/reviews/<feature-slug>.security-privacy-review.md`
- draft security, privacy, audit, compliance, risk, and open-question sections.

**Why?** These decisions shape architecture and stakeholder trust.
