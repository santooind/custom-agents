# Agent Operating Instructions

This workspace contains GitHub Copilot custom agents and reusable skills for HashiCorpExpert workflows.

## Shared Safety Rules

- Never print, copy, persist, or summarize live secret values.
- Redact secret-like values in evidence, examples, and reports.
- Do not modify analyzed application source code during discovery.
- Prefer codebase evidence over assumptions.
- Treat incomplete repositories, legacy systems, generated configuration, and inconsistent naming as normal enterprise conditions.
- Separate facts, assumptions, decisions, risks, and open questions.

## Vault Discovery Ownership

- `.github/agents/vault-discovery-agent.agent.md`: primary orchestration agent.
- `.github/agents/vault-pattern-selection.agent.md`: downstream Vault architect agent for target pattern decisions.
- `.github/agents/vault-migration-plan.agent.md`: downstream planning agent for implementation-ready Vault migration plans.
- `.github/agents/vault-implementation.agent.md`: approval-gated implementation orchestrator for approved Vault migration changes.
- `.github/skills/vault-*/SKILL.md`: independent discovery modules.
- `.github/instructions/vault-discovery-report.instructions.md`: reporting and redaction rules.
- `schemas/vault-discovery-report.schema.json`: standardized JSON contract.
- `reports/`: generated discovery reports when running this workflow inside a target repo copy.

## Vault Pattern Selection Ownership

- Input: `reports/vault-discovery-report.md` and/or `reports/vault-discovery-report.json`.
- Output: `reports/vault-pattern-decision.md`.
- The pattern selection agent ranks rank 1 and rank 2 target patterns and records rejected alternatives.

## Vault Migration Plan Ownership

- Inputs: `reports/vault-discovery-report.md`, `reports/vault-discovery-report.json`, and `reports/vault-pattern-decision.md`.
- Outputs: `reports/vault-migration-plan.md` and `reports/vault-migration-plan.json`.
- The migration plan agent produces implementation planning artifacts only. It must not modify source code, deployment files, CI/CD, Terraform, Vault configuration, or secret stores.

## Vault Implementation Ownership

- Inputs: discovery report, pattern decision, and migration plan artifacts under `reports/`.
- Outputs: `reports/vault-implementation-summary.md` and optionally `reports/vault-implementation-summary.json`.
- Default mode is dry-run/scope review.
- Application source, deployment, CI/CD, Terraform, and Vault configuration changes require explicit user approval.
- Pattern-specific implementation skills own concrete change procedures. The implementation agent owns orchestration, scope control, safety, validation, and summary output.

## Hooks And Deterministic Checks

- `.github/hooks/*`: hook descriptors for artifact, report, redaction, and implementation safety checks.
- `scripts/vault-agentic-artifact-check.*`: validates stage handoffs.
- `scripts/vault-report-lint.*`: checks required Markdown sections.
- `scripts/vault-json-schema-validate.*`: checks JSON parseability and required top-level fields.
- `scripts/vault-secret-redaction-lint.*`: checks reports for obvious unredacted secret-like values.
- `scripts/vault-implementation-safety-check.*`: checks implementation output for unsafe Vault/secret patterns.

Run hooks/scripts before treating generated outputs as review-ready.

## Read-Only Rule

Discovery and planning may search, inspect, and summarize repository metadata. They must not edit application code, deployment manifests, CI/CD files, IaC, secrets, or runtime configuration in the target repository. Implementation may edit approved files only after explicit user approval.
