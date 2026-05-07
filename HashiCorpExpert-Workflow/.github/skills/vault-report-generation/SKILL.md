---
name: vault-report-generation
description: "Generate standardized Vault discovery Markdown and JSON reports with redacted evidence and enterprise aggregation fields."
argument-hint: "[normalized discovery findings and recommendations]"
---

# Vault Report Generation

## Applicability

Run last.

## Markdown Output

Create `reports/vault-discovery-report.md` with exactly these sections:

- Executive Summary
- Repository Details
- Technology Stack
- Deployment Model
- Secret Inventory
- Current Secret Handling
- Risk Findings
- Code Change Impact Matrix
- Recommended Vault Pattern
- Required Code Changes
- Required Infrastructure Changes
- CI/CD Impact
- Operational Risks
- Effort Estimation
- Suggested Migration Sequence
- Potential Breaking Areas
- Open Questions
- Migration Complexity Score
- Evidence Appendix

## JSON Output

Create `reports/vault-discovery-report.json` conforming to `schemas/vault-discovery-report.schema.json`.

## Rules

- Keep evidence redacted.
- Include confidence scores.
- Include assumptions and open questions.
- Include rejected Vault patterns.
- Include portfolio fields: application name, repository path, languages, frameworks, deployment model, complexity score, recommended pattern, risk counts.
- Include a `Code Change Impact Matrix` table:
  `| Area | File/Component | Current Pattern | Recommended Change | Complexity | Risk | Confidence |`
- Include impact estimates for likely files impacted, services/modules impacted, startup/runtime impact likelihood, refactoring likelihood, and backward compatibility concerns.
- Include migration inventory grouped by config-only, code-level, infrastructure, CI/CD, and deployment pipeline changes.
- Include suggested migration sequence and potential breaking areas.
