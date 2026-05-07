---
name: terraform-vault-metadata-implementation
description: "Implement approved Terraform-managed Vault metadata such as auth methods, policies, roles, mounts, and namespaces without secret payloads."
argument-hint: "[approved migration plan and Terraform files]"
---

# Terraform Vault Metadata Implementation

## Applicability

Use when Terraform changes are approved for Vault metadata or platform wiring.

## Approved Changes

May update approved Terraform files for:

- Vault auth method metadata
- Vault policies
- Vault roles
- mounts
- namespaces
- Kubernetes auth role mappings
- CI/CD OIDC/JWT roles

## Do Not

- Do not manage long-lived static secret payloads.
- Do not place secret values in variables, locals, outputs, state, or examples.
- Do not add production mount paths or policies unless approved.

## Implementation Guidance

- Keep secret payloads out of Terraform state.
- Use placeholders for unconfirmed path standards.
- Prefer least-privilege policies.
- Mark manual secret loading or operator workflow separately.

