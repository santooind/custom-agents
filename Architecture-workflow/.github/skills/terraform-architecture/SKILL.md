---
name: terraform-architecture
description: "Design Terraform architecture for modules, providers, backends, state, workspaces, pipelines, policy checks, ServiceNow triggers, and Vault boundaries."
argument-hint: "[Terraform architecture goal]"
---

# Terraform Architecture

Use this skill for Terraform-specific architecture.

## Procedure

1. Define repository, module, environment, workspace, backend, and provider strategy.
2. Define pipeline stages: validate, fmt, lint, security scan, plan, approval, apply, notify.
3. Define remote state security and state access model.
4. Define SNOW-triggered run contract and status callback behavior.
5. Define Vault configuration boundary.
6. Explicitly reject storing static secret payloads in Terraform state, plan files, outputs, variables, logs, or PRs.
7. Document policy checks, failure modes, rollback, and drift management.

Use [Terraform architecture template](../../../templates/terraform-architecture.md).
