---
name: vault-agent-injector-implementation
description: "Implement Vault Agent Injector delivery for Kubernetes/OpenShift workloads using annotations and rendered templates without exposing secret values."
argument-hint: "[approved migration plan and target manifest/chart files]"
---

# Vault Agent Injector Implementation

## Applicability

Use when the selected delivery pattern is Vault Agent Injector or the composed pattern includes `Vault Agent Injector`.

## Approved Changes

May update approved Kubernetes manifests or Helm templates to add:

- Vault Agent Injector annotations
- Vault role reference
- injected template destination
- template command or file path placeholders
- pre-populate behavior when required
- agent resource settings when approved

Use placeholders only:

- `<vault-role>`
- `<vault-path>`
- `<secret-key>`
- `<rendered-file-path>`

## Do Not

- Do not add secret values.
- Do not remove existing Kubernetes Secret references unless rollback has been approved.
- Do not change application code unless another approved skill requires it.
- Do not invent Vault paths, roles, namespaces, or policies without marking placeholders.

## Implementation Guidance

Prefer additive, reversible changes:

- keep existing env var names when possible
- render files to application-compatible locations
- place annotations on pod template metadata, not only top-level workload metadata
- preserve existing labels, probes, resources, and security context
- account for OpenShift constraints when present

## Validation

Recommend or run safe validation:

- YAML syntax checks when tooling exists
- Helm template rendering when chart exists
- search for accidental unredacted secret values

## Summary Fields

Report:

- manifests or chart files changed
- annotations added
- placeholders introduced
- rollback behavior
- tests/validation run

