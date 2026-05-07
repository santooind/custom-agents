---
name: vault-pattern-recommendation
description: "Recommend and rank Vault integration patterns based on discovery evidence, deployment model, code impact, risk, and operational constraints."
argument-hint: "[vault-discovery-report.md/json or normalized discovery findings]"
---

# Vault Pattern Recommendation

## Applicability

Run after discovery, impact analysis, and effort estimation.

Also run when the Vault Pattern Selection Agent consumes:

- `reports/vault-discovery-report.json`
- `reports/vault-discovery-report.md`

## Purpose

Decide the best target Vault pattern and the second-best fallback or phased pattern. The output must be evidence based and suitable for architecture review.

This skill can be used in two places:

- inside Vault Discovery Agent to populate recommended pattern fields
- inside Vault Pattern Selection Agent to generate `reports/vault-pattern-decision.md`

## Candidate Pattern Layers

Evaluate delivery and integration patterns:

- Vault Agent
- Vault Agent Injector
- Vault CSI
- Sidecar pattern
- SDK integration
- Direct Vault API integration
- External secret sync

Evaluate auth methods:

- AppRole
- Kubernetes Auth
- OIDC/JWT
- Cloud IAM auth where applicable

Evaluate secret engines and secret types:

- Dynamic secrets
- Static KV
- Vault PKI

Treat auth methods, delivery methods, and secret engines as composable building blocks. Rank complete usable combinations, for example:

- Kubernetes Auth + Vault Agent Injector + KV v2
- Kubernetes Auth + Vault CSI + Dynamic Database Secrets
- AppRole + Vault Agent rendered files
- OIDC/JWT + CI/CD Vault access
- SDK integration + Dynamic Secrets
- Direct Vault API + explicit token renewal and cache controls
- External Secrets Operator + KV v2
- Vault PKI + mounted certificate delivery

Do not rank a standalone auth method or standalone secret engine as the target architecture. `Kubernetes Auth` alone is not a complete target pattern; `Kubernetes Auth + Vault Agent Injector + KV v2` is complete.

## Required Rank Structure

For Rank 1 and Rank 2, always output:

- Delivery Pattern
- Auth Method
- Secret Engine
- Composed Pattern
- Why this rank
- Confidence

Example:

```text
Rank 1:
Delivery Pattern: Vault Agent Injector
Auth Method: Kubernetes Auth
Secret Engine: KV v2, Dynamic DB optional
Composed Pattern: Kubernetes Auth + Vault Agent Injector + KV v2
Confidence: 0.82
```

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
- If direct Vault API integration is considered, require explicit handling for token renewal, retry behavior, backoff, caching, redaction, and Vault outage behavior.
- If SDK integration is considered, prefer official or mature client libraries and require lease lifecycle tests.
- If sidecar pattern is considered outside Kubernetes, specify process supervision, file permissions, template rendering, and restart behavior.
- If External Secrets Operator or external sync is considered, call out sync delay, stale secret risk, and Kubernetes Secret exposure tradeoffs.

## Ranking Criteria

Score viable patterns from 1 to 5 for:

- deployment fit
- application code change required
- runtime safety
- rotation support
- operational complexity
- CI/CD impact
- rollback simplicity
- enterprise standardization
- legacy compatibility
- confidence from evidence

Then classify each as:

- `Recommended`
- `Viable fallback`
- `Conditional`
- `Not recommended`

## Rank 1 And Rank 2 Rules

Rank 1 must be the safest pattern that fits the current deployment and application behavior.

Rank 2 must be one of:

- fallback if Rank 1 platform prerequisites are unavailable
- phased intermediate pattern
- lower-change pattern for legacy constraints
- higher-capability pattern reserved for a later phase

Do not make SDK or direct API Rank 1 merely because it is flexible. Prefer it only when runtime secret refresh, dynamic credentials, or application behavior requires code-level Vault interaction and the team can own the operational controls.

## Pattern Decision Markdown

When used by Vault Pattern Selection Agent, generate `reports/vault-pattern-decision.md` with:

- Executive Decision
- Input Reports Used
- Decision Summary
- Ranked Pattern Recommendation
- Rank 1 Target Pattern
- Rank 2 Fallback Pattern
- Pattern Scorecard
- Evidence-Based Rationale
- Code And Configuration Impact
- Infrastructure Impact
- CI/CD Impact
- Runtime And Operational Risks
- Migration Sequence
- Rejected Patterns
- Assumptions
- Open Decisions
- Final Recommendation

## Pattern Scorecard

Use a table like:

| Rank | Pattern | Decision | Fit | Code Change | Runtime Risk | Rotation | Ops Complexity | Confidence |
|---|---|---|---|---|---|---|---|---|

## Output

Return:

- rank 1 pattern
- rank 2 pattern
- rank 1 delivery pattern, auth method, secret engine, and composed pattern
- rank 2 delivery pattern, auth method, secret engine, and composed pattern
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
- scorecard
- confidence score
- open decisions
