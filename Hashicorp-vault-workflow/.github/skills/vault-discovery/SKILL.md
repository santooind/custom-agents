---
name: vault-discovery
description: "Discover a codebase's tech stack and secret handling, classify risks, and choose an implementation-ready HashiCorp Vault integration pattern."
argument-hint: "[target codebase path]"
---

# Vault Discovery

Use this skill when asked to analyze a repository before HashiCorp Vault adoption.

## Procedure

1. Identify tech stack from manifests, lockfiles, framework files, runtime config, deployment manifests, CI/CD files, and IaC.
2. Scan for secret handling evidence using metadata-safe commands: `scripts/vault-secret-discovery-scan.sh` on macOS/Linux/WSL/Git Bash or `scripts/vault-secret-discovery-scan.ps1` on Windows.
3. Classify current secret sources: code constants, env vars, `.env`, framework config, Kubernetes secrets, cloud secret stores, CI variables, Terraform, Helm, Docker, and tests.
4. Identify deployment platform and runtime identity options.
5. Recommend one primary Vault integration pattern and one fallback pattern, with a decision matrix for rejected alternatives.
6. Capture Vault design inputs: namespace, mount, engine, path convention, auth method, role, policy, TTL, renewal, rotation, break-glass, audit, and environment separation.
7. List exact code, config, deployment, and CI/CD changes needed.
8. Document assumptions, risks, migration phases, validation approach, and open questions.

Use [Vault discovery template](../../../templates/vault-discovery.md).
