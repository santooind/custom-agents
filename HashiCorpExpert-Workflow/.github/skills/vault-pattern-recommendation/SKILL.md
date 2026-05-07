---
name: vault-pattern-recommendation
description: "Recommend Vault integration pattern based on repository evidence, deployment model, risk, and operational constraints."
argument-hint: "[normalized discovery findings]"
---

# Vault Pattern Recommendation

## Applicability

Run after discovery and effort estimation.

## Candidate Patterns

Evaluate:

- Vault Agent Injector
- Vault CSI
- AppRole
- Kubernetes Auth
- OIDC/JWT
- SDK integration
- Dynamic secrets
- Static KV
- Sidecar pattern
- External secret sync

## Selection Rules

- Kubernetes/OpenShift workload: prefer Kubernetes Auth with Vault Agent Injector or CSI.
- Helm chart present: include chart annotation/template changes.
- VM, bare metal, or app-server deployment: prefer AppRole with Vault Agent rendered files when code changes should be minimized.
- CI/CD-only secret use: prefer OIDC/JWT.
- Database credentials: recommend dynamic secrets when rotation and pooling can support it.
- Legacy config-only applications: recommend rendered files or external secret sync before SDK integration.
- Runtime refresh requirement: consider SDK integration only when lease renewal, caching, logging, and failure behavior can be owned.
- If impact analysis shows mostly config-only changes, prefer rendered files, injection, or external sync over SDK integration.
- If impact analysis shows many code-level changes or high refactoring likelihood, call out phased migration and backward compatibility concerns.
- If impact analysis shows high runtime impact, defer datasource, certificate, or refresh-sensitive migrations later in the suggested sequence.

## Output

Return:

- primary pattern
- supporting patterns
- rationale
- rejected alternatives with reasons
- required code changes
- required infrastructure changes
- CI/CD impact
- operational caveats
- code/config impact rationale
- breaking-area mitigations
