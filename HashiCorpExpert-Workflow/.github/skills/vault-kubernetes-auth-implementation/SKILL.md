---
name: vault-kubernetes-auth-implementation
description: "Implement Kubernetes Auth references and workload identity wiring for Vault integration without secret values."
argument-hint: "[approved migration plan and Kubernetes/Helm/Terraform files]"
---

# Vault Kubernetes Auth Implementation

## Applicability

Use when the selected auth method is Kubernetes Auth.

## Approved Changes

May update approved files for:

- service account references
- Vault role placeholders
- namespace placeholders
- Helm values for service account and Vault role
- Terraform metadata for Vault Kubernetes auth roles when approved

## Do Not

- Do not create or store Kubernetes tokens.
- Do not invent service account names when unknown; use placeholders.
- Do not weaken RBAC or service account scope.

## Implementation Guidance

- Bind Vault role to exact namespace and service account.
- Preserve existing service account behavior.
- Identify audience or issuer requirements as open questions if unknown.
- Keep auth mount path configurable.

