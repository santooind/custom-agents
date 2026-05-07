# Agent Operating Instructions

This workspace creates and applies HashiCorp Vault adoption plans for existing application codebases.

## Shared Rules

- Separate facts, assumptions, decisions, risks, and open questions.
- Treat all discovered secret-like material as sensitive. Redact values in outputs.
- Never commit, echo, log, summarize, or move live secret values.
- Prefer codebase evidence over guesswork. Cite files, frameworks, deployment manifests, and CI/CD configuration when making recommendations.
- Choose the lowest-risk Vault pattern that fits the runtime platform and existing architecture.
- Keep enterprise Vault workflow documents in `vault/`.
- Keep original workflow documents in `docs/vault/` when using the legacy prompts.
- Use templates from `templates/` unless the user asks for another format.
- Mark document status as `Draft`, `Needs Answers`, `Ready For Implementation`, `Implemented`, or `Ready For Release`.

## Responsibility Split

Keep the workflow balanced:

- Agents define role, safety rules, decision logic, handoffs, and expected outputs.
- Skills define short reusable procedures for doing the work.
- Templates define the required document structure, tables, checklists, and evidence fields.
- Scripts and hooks perform deterministic validation, audit logging, and repeatable scans.

Do not duplicate every detail everywhere. Put durable guardrails in agents, repeatable task steps in skills, document shape in templates, and machine-checkable rules in scripts.

## Cross-Platform Automation

Provide both Bash and PowerShell paths when documenting commands:

- Use `*.sh` scripts on macOS, Linux, WSL, Git Bash, or Unix-like CI runners.
- Use `*.ps1` scripts on Windows PowerShell or PowerShell 7.
- Keep Bash and PowerShell scripts behaviorally equivalent: same purpose, same exit-code intent, same redaction posture.

## Multi-Agent Protocol

First identify the workflow mode.

### Light Mode

Use for metadata-only discovery:

1. Vault Discovery Architect
2. Vault Question Curator
3. Vault Architecture Challenger

No implementation changes.

### Standard Mode

Use for normal application Vault adoption planning:

1. Vault Discovery Architect
2. Vault Question Curator
3. Vault Architecture Challenger
4. Vault Identity Policy Architect
5. Vault Secret Lifecycle Architect
6. Vault Platform Integration Architect
7. Vault Test Automation Agent

Implementation requires explicit approval.

### Enterprise Release Mode

Use for production rollout, regulated data, privileged access, client-facing commitments, cross-team migration, or release approval:

1. Vault Discovery Architect maps current secret handling.
2. Vault Question Curator extracts decisions and blockers.
3. Vault Architecture Challenger reviews unsafe assumptions.
4. Identity, lifecycle, platform, security/compliance, operations, and migration specialists write their review/design artifacts.
5. Vault Test Automation Agent writes validation evidence and automation.
6. Vault Release Freezer checks readiness and creates a frozen baseline only after explicit approval.

### Original Workflow

Use this collaboration order when the user invokes the original `vault-workflow`:

1. Vault Workflow Orchestrator captures target path, raw input, constraints, and expected outputs.
2. Vault Discovery Architect scans the codebase and creates the discovery document.
3. Vault Implementation Agent turns the discovery decision into code, config, deployment, CI, and runbook changes.
4. Vault Test Automation Agent writes test cases and validation automation.
5. Orchestrator reconciles outputs, runs deterministic checks, and reports release readiness.

Each specialist must return:

- `Findings`
- `Files Created Or Updated`
- `Security Considerations`
- `Operational Considerations`
- `Open Questions`
- `Readiness Impact`

## Vault Integration Pattern Preference

Prefer patterns in this order when they fit the platform:

1. Runtime injection with Vault Agent, Vault Agent Injector, or CSI driver.
2. Native workload identity auth with short-lived Vault tokens.
3. Application SDK/API access with strict lease renewal, caching, and redaction controls.
4. Controlled operator workflow for static secret write or rotation.

Avoid patterns where secrets pass through Terraform state, pull requests, CI logs, ServiceNow notes, application logs, or broad environment dumps.

## Readiness Gates

A Vault workflow is not ready for implementation until:

- current secret handling is mapped with codebase evidence,
- the selected Vault pattern has rationale and rejected alternatives,
- required application, deployment, CI/CD, Vault, and operational changes are listed,
- open questions that affect security or implementation are resolved or marked blocking.

A Vault workflow is not ready for release until:

- implementation changes are complete or explicitly out of scope,
- automated validation passes or findings are accepted with owners,
- tests cover success, failure, redaction, rotation, rollback, and CI/CD auth,
- rollback and audit evidence paths are documented.

## Enterprise File Ownership

- `vault/discovery/*.discovery.md`: Vault Discovery Architect.
- `vault/questions/*.open-questions.md`: Vault Question Curator.
- `vault/reviews/*`: owning reviewer.
- `vault/policies/*`: Vault Identity Policy Architect.
- `vault/design/*`: lifecycle or platform specialist.
- `vault/operations/*`: Vault Operations Resilience Reviewer.
- `vault/implementation/*.migration-cutover.md`: Vault Migration Cutover Planner.
- `vault/release/*`: Vault Release Freezer.
- `vault/frozen/*`: Vault Release Freezer only.
