---
name: vault-effort-estimation
description: "Estimate Vault migration effort, testing effort, deployment complexity, rollback complexity, runtime risk, and secret rotation complexity."
argument-hint: "[normalized discovery findings]"
---

# Vault Effort Estimation

## Applicability

Run after discovery skills.

## Inputs

Use normalized findings from all discovery skills.

Also use the code change impact matrix:

- number of likely files impacted
- number of services/modules impacted
- location confidence
- modification complexity by area
- runtime impact risk by area
- testing impact
- backward compatibility concerns

## Categories

Estimate:

- development effort
- testing effort
- deployment complexity
- rollback complexity
- runtime risk
- secret rotation complexity

Use:

- Low
- Medium
- High
- Critical

## Scoring Guidance

Start at `Low`.

Raise complexity when evidence includes:

- monorepo with multiple runtimes
- legacy Java EE or XML-heavy Spring
- custom encryption utilities
- hardcoded fallback credentials
- multi-tenant datasource
- dynamic datasource routing
- long-lived connection pools
- Kubernetes plus Helm plus GitOps coordination
- VM/app-server deployment without workload identity
- CI/CD secrets used across stages
- certificates/private keys
- logging exposure risk
- unknown deployment model
- high likely file impact count
- multiple services or modules impacted
- medium or high refactoring likelihood
- high startup/runtime impact likelihood

## Output

Return:

- category estimates
- numeric migration complexity score from 1 to 100
- rationale bullets
- assumptions
- blockers
