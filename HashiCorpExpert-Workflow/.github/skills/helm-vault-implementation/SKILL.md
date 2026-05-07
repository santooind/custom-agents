---
name: helm-vault-implementation
description: "Implement approved Vault-related Helm values and templates for Injector, CSI, service account, and rollout controls."
argument-hint: "[approved migration plan and Helm chart files]"
---

# Helm Vault Implementation

## Applicability

Use when Helm `Chart.yaml`, `values.yaml`, or `templates/` are in scope.

## Approved Changes

May update approved Helm files for:

- Vault Agent Injector annotations
- CSI volumes and mounts
- service account values
- Vault role values
- environment-specific toggles
- backward-compatible rollout flags

## Do Not

- Do not place secret values in `values.yaml`.
- Do not break existing chart value names without approval.
- Do not remove existing secrets before rollback is approved.

## Implementation Guidance

- Prefer values-driven toggles.
- Keep defaults disabled or environment-controlled if rollout is phased.
- Run `helm template` when available.

