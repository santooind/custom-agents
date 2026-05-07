---
name: vault-identity-policy-design
description: "Design Vault auth methods, identity mapping, roles, policies, namespaces, mounts, token TTLs, renewal behavior, and least-privilege access boundaries."
argument-hint: "[Vault discovery or policy goal]"
---

# Vault Identity Policy Design

Use this skill when designing who or what can authenticate to Vault and which paths they can access.

## Procedure

1. Identify actors: workloads, operators, CI/CD, break-glass users, and automation.
2. Select auth method based on platform evidence.
3. Define namespace, mount, role, policy, path, token TTL, max TTL, renewal, and audit expectations.
4. Keep policies least-privilege and environment-scoped.
5. Convert unconfirmed names, paths, namespaces, auth methods, and TTLs into questions.

**Why?** Least privilege is the core control in Vault adoption.
