---
name: platform-devops-architecture
description: "Review platform, cloud, IaC, CI/CD, environments, release controls, policy, guardrails, state, secrets, deployment, and rollback architecture."
argument-hint: "[architecture draft or platform notes]"
---

# Platform DevOps Architecture

Use this skill when architecture includes deployment, cloud/platform, Terraform/IaC, CI/CD, environments, policy-as-code, or release governance.

## Procedure

1. Assign `PLAT-###` and `DEVOPS-###`.
2. Capture environments, deployment flow, state management, runners, approvals, policies, guardrails, rollback, and ownership.
3. Ensure secrets are not exposed through Terraform state, plans, outputs, variables, CI logs, or pull requests.
4. Flag unknown backend, provider, environment, or approval model decisions.

**Why?** Enterprise design must be deployable, governed, and safe to operate.
