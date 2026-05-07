# Agent Operating Instructions

This workspace creates enterprise architecture documents and specialized ServiceNow, Terraform, and HashiCorp Vault integration architectures.

## Shared Rules

- Separate architecture facts, assumptions, decisions, risks, and open questions.
- Do not invent environment details, compliance obligations, ServiceNow licensing, Vault edition features, cloud provider controls, or Terraform backend choices.
- Never recommend storing static secret values in Terraform variables, resources, outputs, state, plan files, CI logs, or pull requests.
- Terraform can manage Vault platform configuration but must not manage long-lived static secret payloads.
- ServiceNow may orchestrate requests, approvals, tickets, CMDB updates, and fulfillment workflows, but credential material must be retrieved through approved secure runtime paths.
- Keep enterprise architecture outputs in `architecture/`.
- Keep legacy or vendor-specific architecture outputs in `docs/architecture/` when using the original ServiceNow/Terraform/Vault workflow.
- Use templates from `templates/` unless the user asks for another format.
- Mark document status as `Draft`, `Needs Answers`, `Ready For Review`, `Ready To Freeze`, or `Frozen`.

## Multi-Agent Protocol

First identify the workflow mode.

### Light Mode

Use for small/internal designs:

1. Enterprise Solution Architect
2. Architecture Question Curator
3. Architecture Challenger
4. Architecture Decision Record Agent

### Standard Mode

Use for normal product/client architecture:

1. Enterprise Solution Architect
2. Architecture Question Curator
3. Architecture Challenger
4. Application Domain Architect
5. Integration Architecture Reviewer
6. Data Architecture Reviewer
7. Platform DevOps Architect
8. Resilience Operations Reviewer
9. Architecture Decision Record Agent
10. Architecture Traceability Agent

Add Security/Privacy when the solution touches access control, secrets, regulated data, PII, audit, or external trust boundaries.

### Enterprise Freeze Mode

Use for high-risk, regulated, contractual, security-sensitive, production-critical, cost-sensitive, or formal baseline architecture:

1. Enterprise Solution Architect creates or updates the working draft.
2. Architecture Question Curator extracts decisions and clarifications.
3. Architecture Challenger reviews for gaps, contradictions, and hidden assumptions.
4. Specialist agents review application/domain, integration, data, security/privacy, platform, resilience/ops, and cost/governance.
5. Architecture Decision Record Agent records major decisions.
6. Architecture Traceability Agent validates coverage.
7. Architecture Executive Summary Writer updates leadership summary.
8. Final Architecture Freezer checks readiness and creates a frozen baseline only after explicit approval.

### ServiceNow / Terraform / Vault Mode

Use this collaboration order when the architecture specifically involves ServiceNow, Terraform, and Vault:

1. Architecture Orchestrator captures raw input and defines the document package.
2. ServiceNow Architect drafts SNOW workflows, catalog, approvals, integration, CMDB, audit, and operational model.
3. Terraform Architect drafts IaC modules, state, workspace, pipeline, provider, guardrail, and provisioning model.
4. HashiCorp Vault Agent drafts secret engines, policies, auth methods, namespaces, audit, and static secret lifecycle.
5. Specialists exchange assumptions and interface needs through Architecture Interface Documents.
6. Architecture Critic reviews for security, operational, integration, and freeze blockers.
7. Question Curator converts unresolved issues into clear user questions.
8. Orchestrator reconciles everything and sets freeze readiness.

Each specialist must return:

- `Architecture Contributions`
- `Interface Dependencies`
- `Security Considerations`
- `Operational Considerations`
- `Open Questions`
- `Freeze Impact`

## Required Documents

- End-to-end architecture document.
- SNOW architecture document.
- AID between SNOW and Terraform.
- AID between SNOW and Vault.
- Security review.
- Open questions.

## Enterprise Required Documents

For enterprise mode, create only the documents required by the selected mode:

- working architecture draft,
- open questions,
- challenge and specialist reviews,
- ADRs,
- interface documents when integrations are material,
- traceability matrix,
- freeze baseline only after explicit approval.
