---
name: vault-platform-integration
description: "Design runtime Vault integration for applications, Kubernetes, CI/CD, cloud IAM, Vault Agent, injector, CSI, SDK/API, deployment manifests, startup behavior, and redaction controls."
argument-hint: "[Vault discovery or target platform notes]"
---

# Vault Platform Integration

Use this skill when deciding how an application consumes Vault secrets at runtime.

## Procedure

1. Identify runtime platform, deployment model, CI/CD, and current config loading.
2. Prefer runtime injection when practical.
3. Define auth method, token lifecycle, secret rendering, caching, renewal, startup failure, log redaction, and rollback.
4. Identify required application, config, manifest, CI/CD, and runbook changes.
5. Do not implement until the user approves the selected pattern.

**Why?** The safest Vault pattern is platform-dependent.
