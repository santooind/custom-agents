---
name: vault-security-compliance-review
description: "Review Vault adoption for secret exposure, policy scope, namespace isolation, auth risks, audit evidence, privileged access, compliance assumptions, and sensitive value redaction."
argument-hint: "[Vault discovery, design, implementation, or release package]"
---

# Vault Security Compliance Review

Use this skill for security-sensitive Vault discovery, design, implementation, or release review.

## Procedure

1. Check for secret payload exposure in docs, code, config, Terraform, CI/CD, logs, tests, and pull requests.
2. Review auth method, policies, namespaces, mounts, token TTLs, audit, privileged access, and break-glass.
3. Treat static secret payload exposure through Terraform state or plan as critical.
4. Redact any secret-like values.
5. Convert missing audit/compliance evidence into release blockers when production is involved.

**Why?** Vault workflows must hold a stricter security bar than ordinary configuration.
