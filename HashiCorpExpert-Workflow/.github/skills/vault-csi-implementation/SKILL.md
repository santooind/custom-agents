---
name: vault-csi-implementation
description: "Implement Vault CSI based secret delivery for Kubernetes workloads using SecretProviderClass and mounted files."
argument-hint: "[approved migration plan and target Kubernetes/Helm files]"
---

# Vault CSI Implementation

## Applicability

Use when the selected delivery pattern is Vault CSI or the composed pattern includes `Vault CSI`.

## Approved Changes

May add or update approved files for:

- `SecretProviderClass`
- CSI volumes
- volume mounts
- service account references
- provider parameters with placeholders
- sync-as-Kubernetes-Secret only when explicitly approved

## Do Not

- Do not include secret values.
- Do not enable Kubernetes Secret sync unless the migration plan approves the exposure tradeoff.
- Do not remove existing secret source before rollback window is approved.

## Implementation Guidance

- Mount secrets at stable paths.
- Preserve existing app config names when possible.
- Keep provider parameters generic if Vault path standards are not confirmed.
- Document refresh behavior and stale secret risk.

## Validation

Recommend or run:

- YAML validation
- Helm rendering
- manifest search for accidental secret payloads

