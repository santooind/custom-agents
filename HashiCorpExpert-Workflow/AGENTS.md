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
- `.github/skills/vault-*/SKILL.md`: independent discovery modules.
- `.github/instructions/vault-discovery-report.instructions.md`: reporting and redaction rules.
- `schemas/vault-discovery-report.schema.json`: standardized JSON contract.
- `reports/`: generated discovery reports when running this workflow inside a target repo copy.

## Read-Only Rule

Discovery may search, inspect, and summarize repository metadata. It must not edit application code, deployment manifests, CI/CD files, IaC, secrets, or runtime configuration in the target repository.

