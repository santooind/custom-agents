---
name: vault-csi-test-skill
description: "Define and run safe validation for Vault CSI mounted secret delivery."
argument-hint: "[migration plan, implementation summary, manifests or Helm chart]"
---

# Vault CSI Test Skill

## Applicability

Use when the selected pattern includes Vault CSI.

## Test Focus

- `SecretProviderClass` structure
- CSI volume and mount alignment
- mounted path matches application expectation
- sync-to-Kubernetes-Secret is avoided unless approved
- rotation/refresh behavior is documented

## Safe Automated Checks

- YAML syntax check
- `helm template`
- manifest search for CSI volume and mount
- redaction scan

## Manual Validation Required

- [ ] Mounted files appear in lower-environment pod.
- [ ] File permissions allow application read.
- [ ] Rotation/refresh behavior is observed or documented.
- [ ] Application restarts cleanly if mounted secret is unavailable.

