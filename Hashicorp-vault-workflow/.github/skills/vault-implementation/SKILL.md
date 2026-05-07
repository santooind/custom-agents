---
name: vault-implementation
description: "Implement an approved HashiCorp Vault integration pattern in application code, configuration, deployment manifests, CI/CD, and runbooks."
argument-hint: "[discovery document path]"
---

# Vault Implementation

Use this skill when applying Vault changes after discovery.

## Procedure

1. Read the discovery document and identify the selected pattern.
2. Confirm the application's current configuration loading path before editing.
3. Implement the smallest safe change that routes secret resolution through Vault or Vault-rendered files.
4. Add startup validation and clear non-secret error messages.
5. Add redaction for config dumps, errors, traces, and test output.
6. Update deployment manifests, Vault annotations/templates, CI/CD auth, or runtime identity configuration.
7. Keep Terraform limited to non-secret Vault configuration such as mounts, policies, auth roles, namespaces, and metadata.
8. Update docs and rollback notes.
9. Run existing tests and the platform lint script: `scripts/vault-boundary-lint.sh` or `scripts/vault-boundary-lint.ps1`.

Use [Vault implementation plan template](../../../templates/vault-implementation-plan.md).
