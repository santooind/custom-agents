# Enterprise Architecture Workflow

## Recommended Agent List

1. Enterprise Architecture Orchestrator
2. Enterprise Solution Architect
3. Architecture Question Curator
4. Architecture Challenger
5. Application Domain Architect
6. Integration Architecture Reviewer
7. Enterprise AID Architect
8. Data Architecture Reviewer
9. Security Privacy Architecture Reviewer
10. Platform DevOps Architect
11. Resilience Operations Reviewer
12. Cost Governance Reviewer
13. Architecture Decision Record Agent
14. Architecture Traceability Agent
15. Architecture Executive Summary Writer
16. Final Architecture Freezer
17. ServiceNow Data Model Architect
18. ServiceNow ERD Architect
19. Architecture Review Response Agent

Domain specialists remain available when relevant:

- ServiceNow Architect Agent
- Terraform Architect Agent
- HashiCorp Vault Agent

**Why?** General architecture roles cover enterprise review, while vendor specialists handle deep platform details.

## Folder Structure

```text
architecture/
  raw-input/        # source notes, requirements, transcripts, diagram text
  working-draft/    # editable architecture documents
  interface-docs/   # Architecture Interface Documents
  decisions/        # ADRs
  diagrams/         # diagram source or exported images
  questions/        # user/client decisions and clarifications
  reviews/          # challenger and specialist reviews
  risks/            # optional standalone risk registers
  traceability/     # goal/requirement-to-architecture mapping
  frozen/           # immutable frozen architecture baselines
  baselines/        # freeze metadata and approval evidence
  change-log/       # version history
  context/          # shared memory: glossary, standards, platform inventory
  agents/           # exported or team-specific agent variants
```

**Why?** Architecture agents communicate through durable artifacts, which makes the workflow auditable.

## Workflow Modes

### Light Mode

Use for small/internal technical designs.

Agents:

- Enterprise Solution Architect
- Architecture Question Curator
- Architecture Challenger
- Architecture Decision Record Agent

Artifacts:

- `architecture/working-draft/<solution-slug>.architecture.md`
- `architecture/questions/<solution-slug>.open-questions.md`
- `architecture/reviews/<solution-slug>.challenge-review.md`
- `architecture/decisions/<solution-slug>.adr.md`

Escalate to Standard if the design reveals integrations, sensitive data, production SLA, platform changes, compliance, cost impact, or formal approval.

### Standard Mode

Use for normal product/client solution architecture.

Agents:

- Enterprise Solution Architect
- Architecture Question Curator
- Architecture Challenger
- Application Domain Architect
- Integration Architecture Reviewer
- Data Architecture Reviewer
- Platform DevOps Architect
- Resilience Operations Reviewer
- Architecture Decision Record Agent
- Architecture Traceability Agent

Add Security/Privacy when the solution touches access control, secrets, regulated data, PII, audit, or external trust boundaries.

### Enterprise Freeze Mode

Use for high-risk, regulated, contractual, security-sensitive, privacy-sensitive, production-critical, cost-sensitive, or formal baseline work.

Agents:

- full enterprise architecture agent set
- relevant vendor specialists

Artifacts:

- full architecture draft
- all applicable specialist reviews
- interface documents
- ADRs
- executive summary
- traceability
- freeze readiness review
- frozen baseline after explicit approval

### Auto Mode

Use when unsure. The orchestrator chooses the smallest safe mode and explains why.

## Handoff Model

| From | To | Artifact | Purpose |
|---|---|---|---|
| User | Orchestrator | raw input | Start workflow |
| Orchestrator | Solution Architect | raw input | Create structured draft |
| Solution Architect | Question Curator | assumptions/gaps | Create user questions |
| Solution Architect | Challenger | architecture draft | Find gaps and contradictions |
| Challenger | Specialists | review findings | Deep architecture review |
| Specialists | Solution Architect | specialist reviews | Update draft from accepted findings |
| Solution Architect | ADR Agent | major decisions | Capture decision trail |
| Solution Architect | Traceability Agent | updated draft | Validate mapping |
| Traceability Agent | Final Freezer | traceability and draft | Decide freeze readiness |

## File Ownership

| Artifact | Primary Writer | Reviewers |
|---|---|---|
| `working-draft/*.architecture.md` | Enterprise Solution Architect | all reviewers |
| `questions/*.open-questions.md` | Architecture Question Curator | all agents |
| `reviews/*.challenge-review.md` | Architecture Challenger | Orchestrator |
| `reviews/*.integration-review.md` | Integration Architecture Reviewer | Security/Data/Ops |
| `interface-docs/*.aid*.md` | Enterprise AID Architect | Integration/Security/Ops |
| `working-draft/*.servicenow-data-model.md` | ServiceNow Data Model Architect | ServiceNow/Security |
| `diagrams/*.servicenow-erd.md` | ServiceNow ERD Architect | Data Model Architect |
| `reviews/*.executive-architecture-review.md` | Architecture Review Response Agent | Orchestrator |
| `reviews/*.hld-review-response.md` | Architecture Review Response Agent | Orchestrator |
| `reviews/*.security-privacy-review.md` | Security Privacy Architecture Reviewer | Solution Architect |
| `reviews/*.data-architecture-review.md` | Data Architecture Reviewer | Security/Integration |
| `reviews/*.platform-devops-review.md` | Platform DevOps Architect | Security/Ops |
| `reviews/*.resilience-operations-review.md` | Resilience Operations Reviewer | Platform |
| `reviews/*.cost-governance-review.md` | Cost Governance Reviewer | Orchestrator |
| `decisions/*.adr.md` | Architecture Decision Record Agent | Traceability |
| `traceability/*.traceability.md` | Architecture Traceability Agent | Freezer |
| `frozen/*.architecture.v*.md` | Final Architecture Freezer | no direct edits |

## Avoiding Circular Edits

- One primary writer owns each artifact.
- Reviewers write review files instead of silently rewriting the main draft.
- The solution architect reconciles accepted review findings.
- The freezer copies approved content into `architecture/frozen/`; it does not redesign during freeze.

## Version History

- Draft versions use `v0.1`, `v0.2`, etc.
- Frozen versions use `v1.0`, `v1.1`, etc.
- Every meaningful architecture change goes into `architecture/change-log/<solution-slug>.change-log.md`.
- Do not edit frozen baselines in place.

## When To Ask The User

Ask when the missing answer affects:

- architecture scope,
- technology choice,
- cloud/provider model,
- integration contract,
- data source of truth,
- security/privacy/compliance,
- secrets handling,
- SLA/SLO/RTO/RPO,
- platform ownership,
- cost/licensing,
- rollout/rollback,
- freeze readiness.

## Ready To Freeze

Architecture is ready to freeze when:

- all freeze-blocking questions are answered,
- critical/high findings are resolved or explicitly accepted,
- ADRs exist for major decisions,
- interface documents are complete enough for delivery,
- security/privacy, data, platform, operations, and cost/governance are reviewed where applicable,
- traceability has no orphan critical components or integrations,
- approval owners are recorded.

## Example Codex Workflow

```text
Use the Enterprise Architecture Orchestrator.

Mode: Auto
Raw input is in architecture/raw-input/client-architecture-notes.md.
Create a complete architecture package.
Use specialist reviews only where needed.
Do not freeze until I explicitly approve.
```

## Prompt Commands

```text
/light-architecture-workflow
/standard-architecture-workflow
/enterprise-architecture-workflow
/freeze-architecture
/create-servicenow-data-model
/create-servicenow-erd-pack
/create-architecture-review
```
