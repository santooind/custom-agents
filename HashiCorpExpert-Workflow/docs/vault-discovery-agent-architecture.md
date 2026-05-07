# Vault Discovery Agent Architecture

## Purpose

The Vault Discovery Agent analyzes application repositories and generates standardized discovery reports for HashiCorp Vault migration planning across 300+ enterprise applications.

It is implemented as a GitHub Copilot custom agent pack:

- one primary orchestration agent
- one downstream pattern selection agent
- one downstream migration planning agent
- one approval-gated implementation agent
- multiple reusable discovery skills
- standardized Markdown and JSON outputs
- safe read-only discovery rules
- extensible reporting schema for portfolio aggregation

## Directory Structure

```text
HashiCorpExpert-Workflow/
  .github/
    agents/
      vault-discovery-agent.agent.md
      vault-pattern-selection.agent.md
      vault-migration-plan.agent.md
      vault-implementation.agent.md
    skills/
      vault-repo-fingerprint/
      vault-secret-detection/
      vault-java-spring-discovery/
      vault-nodejs-discovery/
      vault-python-discovery/
      vault-dotnet-discovery/
      vault-kubernetes-discovery/
      vault-cicd-discovery/
      vault-terraform-discovery/
      vault-docker-discovery/
      vault-certificate-discovery/
      vault-database-discovery/
      vault-auth-pattern-discovery/
      vault-logging-risk-discovery/
      vault-code-change-impact-analysis/
      vault-effort-estimation/
      vault-pattern-recommendation/
      vault-report-generation/
    prompts/
      vault-discovery-agent.prompt.md
      vault-pattern-selection.prompt.md
      vault-migration-plan.prompt.md
      vault-implementation.prompt.md
    instructions/
      vault-discovery-report.instructions.md
  docs/
    vault-discovery-agent-architecture.md
    vault-discovery-local-workflow.md
    vault-hooks-and-safety.md
    vault-discovery-roadmap.md
  scripts/
    vault-agentic-artifact-check.sh
    vault-agentic-artifact-check.ps1
    vault-report-lint.sh
    vault-report-lint.ps1
    vault-json-schema-validate.sh
    vault-json-schema-validate.ps1
    vault-secret-redaction-lint.sh
    vault-secret-redaction-lint.ps1
    vault-implementation-safety-check.sh
    vault-implementation-safety-check.ps1
  schemas/
    vault-discovery-report.schema.json
  examples/
    vault-discovery-report.md
    vault-discovery-report.json
    vault-pattern-decision.md
    vault-migration-plan.md
    vault-migration-plan.json
    vault-implementation-summary.md
    vault-implementation-summary.json
  reports/
```

## Primary Orchestrator

The primary agent owns consistency, sequencing, safety, and report quality.

Responsibilities:

1. Detect repository type.
2. Determine applicable skills.
3. Execute only relevant discovery skills.
4. Normalize findings and evidence.
5. Calculate complexity.
6. Recommend Vault integration pattern.
7. Generate Markdown report.
8. Generate machine-readable JSON.
9. Optionally prepare metadata-only external submission.

The orchestrator does not implement application changes.

## Pattern Selection Agent

The Vault Pattern Selection Agent consumes the discovery outputs:

- `reports/vault-discovery-report.md`
- `reports/vault-discovery-report.json`

It produces:

- `reports/vault-pattern-decision.md`

This agent plays the role of a HashiCorp Vault architect. It ranks the best target pattern as rank 1 and the fallback or phased option as rank 2. It uses the `vault-pattern-recommendation` skill and does not rediscover the repository unless the discovery report is missing or incomplete.

## Migration Plan Agent

The Vault Migration Plan Agent consumes:

- `reports/vault-discovery-report.md`
- `reports/vault-discovery-report.json`
- `reports/vault-pattern-decision.md`

It produces:

- `reports/vault-migration-plan.md`
- `reports/vault-migration-plan.json`

This agent converts discovery and pattern decisions into an implementation-ready migration plan. It defines secret mapping, code/config changes, infrastructure changes, CI/CD changes, implementation sequence, minimum tests, rollback, cutover, risk register, open questions, and readiness. It is still read-only and must not modify application files or expose secrets.

## Implementation Agent

The Vault Implementation Agent consumes all prior reports and either:

- produces a dry-run implementation scope preview, or
- applies approved scoped changes using pattern-specific skills.

It produces:

- `reports/vault-implementation-summary.md`
- optional `reports/vault-implementation-summary.json`

The agent uses one orchestrator with focused implementation skills. This avoids one giant implementation prompt while keeping coordination centralized.

Pattern-specific skills include:

- Vault Agent Injector implementation
- Vault CSI implementation
- Java Spring SDK implementation
- AppRole implementation
- Kubernetes Auth implementation
- Dynamic Database Secret implementation
- KV Static Secret implementation
- Helm Vault implementation
- CI/CD Vault implementation
- Vault PKI Certificate implementation
- Docker Vault Agent implementation
- Terraform Vault Metadata implementation

Implementation is approval-gated and must not add secret values.

## Hooks And Scripts

The workflow includes deterministic checks for:

- agentic artifact order
- required report sections
- JSON output structure
- secret redaction
- implementation safety boundaries

These checks complement the agent instructions. They provide repeatable gates that can run locally or in CI.

## Skill Contract

Each skill must expose the following behavioral contract in its `SKILL.md`:

- applicability check
- scan procedure
- finding categories
- evidence collection rules
- confidence scoring guidance
- safety rules
- expected normalized output

Every finding should contain:

- `id`
- `title`
- `category`
- `severity`
- `confidence`
- `description`
- `evidence`
- `migration_impact`
- `recommended_action`
- `impact_entry_ids`

Evidence should contain:

- `file`
- `line`
- `evidence_type`
- `excerpt`
- `confidence`

The excerpt must be redacted.

## Code Change Impact Contract

The agent must translate findings into a code/configuration impact matrix. Each impact entry captures:

- exact or probable file path
- component, class, module, chart, manifest, pipeline, or Terraform module
- secret usage purpose
- current retrieval mechanism
- recommended replacement approach
- modification complexity
- runtime impact risk
- testing impact
- backward compatibility concern
- confidence score

Location confidence must be explicit:

- `Exact`: evidence points directly to the file or component.
- `Probable`: framework convention or adjacent evidence strongly suggests the location.
- `Assumed`: repository is incomplete or the location is external to the scanned files.

The impact analysis also produces:

- likely files impacted
- likely services or modules impacted
- startup/runtime impact likelihood
- refactoring likelihood
- migration inventory by change type
- suggested migration sequence
- potential breaking areas

## Why This Scales

The design scales across 300+ applications because it separates portfolio consistency from technology-specific discovery.

- The primary agent guarantees a consistent report structure, scoring model, and recommendation style.
- Skills can evolve independently as new frameworks, platforms, and secret patterns are discovered.
- JSON schema gives central teams a stable aggregation contract.
- Evidence confidence allows imperfect enterprise repositories to be analyzed without pretending certainty.
- Read-only operation allows broad scanning without remediation risk.

## Why Orchestration Plus Skills Beats Many Independent Agents

Many independent agents would produce inconsistent report structures, duplicate scanning, conflicting assumptions, and uneven safety behavior.

One orchestrator plus skills is better for discovery because:

- one agent owns the final answer
- skills remain focused and reusable
- only relevant skills run deeply
- report format stays standardized
- secret redaction rules remain centralized
- scoring and recommendations are comparable across applications

Independent agents can still be added later for remediation, platform design, policy generation, testing, and release readiness, but discovery needs consistency first.

## Evolution Into Autonomous Remediation

This architecture can evolve safely:

1. Discovery Agent creates read-only evidence and recommendations.
2. Planning Agent converts approved recommendations into implementation tasks.
3. Remediation Agents modify code, manifests, CI/CD, Vault policy, and runbooks only after explicit approval.
4. Test Agent validates success, failure, rotation, rollback, and redaction behavior.
5. Release Agent gates production readiness and freezes approved baselines.

The discovery JSON becomes the handoff contract for future remediation agents.

## Central Reporting Across 300+ Apps

Each application produces a JSON report conforming to `schemas/vault-discovery-report.schema.json`.

Central aggregation can load:

- application identity
- repository metadata
- stack and deployment model
- secret inventory summary
- risk counts
- recommended Vault pattern
- complexity score
- effort estimate
- open blockers
- evidence confidence

Typical dashboard views:

- applications by recommended Vault pattern
- likely file and module impact by application
- critical/high secret exposure risks
- Kubernetes-ready apps
- VM/AppRole candidates
- dynamic database secret candidates
- apps blocked by unknown deployment model
- effort distribution by team or business unit
- migration wave planning by complexity

## Observability

Reports should include:

- generation timestamp
- agent version or workflow version
- target repository path
- files or evidence count where available
- assumptions
- warnings
- confidence scores

Do not log secret values.
