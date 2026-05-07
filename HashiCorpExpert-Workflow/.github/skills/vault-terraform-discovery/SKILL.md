---
name: vault-terraform-discovery
description: "Discover Terraform and IaC patterns relevant to Vault migration without recommending secret payloads in state."
argument-hint: "[target repository path]"
---

# Vault Terraform Discovery

## Applicability

Run when `.tf`, `.tfvars`, Terragrunt, or IaC directories exist. Otherwise perform a lightweight check.

## Scan Procedure

Detect:

- providers
- backends
- modules
- Kubernetes resources
- Vault provider usage
- Helm releases
- secret resources
- variable files
- CI-driven Terraform

## Risk Rules

Flag high risk when Terraform appears to manage:

- long-lived secret payloads
- Kubernetes Secret data
- Vault KV secret values
- credentials in variables, outputs, locals, or state-sensitive resources

## Safe Recommendation

Terraform may manage:

- Vault namespaces
- policies
- auth methods
- mounts
- roles
- metadata

Terraform should not manage long-lived static secret payloads unless an explicit controlled exception exists.

## Output

Return IaC findings, deployment impacts, and risks with masked evidence.

