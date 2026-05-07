---
name: vault-enterprise-discovery
description: "Perform metadata-only enterprise HashiCorp Vault discovery for an existing codebase, mapping current secret handling, runtime platform, CI/CD, IaC, risks, and candidate Vault integration patterns without exposing secret values."
argument-hint: "[target codebase path or raw input]"
---

# Vault Enterprise Discovery

Use this skill to discover current secret handling and recommend a Vault adoption pattern.

## Procedure

1. Capture target path, platform, runtime, deployment, CI/CD, IaC, and constraints.
2. Scan for secret handling metadata only. Redact any values.
3. Map sources: env vars, config files, framework settings, Kubernetes/deployment secrets, CI variables, Terraform/IaC, code, logs, and docs.
4. Build metadata-only secret inventory.
5. Compare Vault patterns: Agent/injector, CSI, workload identity, CI/CD OIDC/JWT, SDK/API, controlled operator workflow.
6. Mark blockers for auth, policy, path, rotation, audit, rollback, or release readiness.

**Why?** Discovery should create evidence, not move secrets around.
