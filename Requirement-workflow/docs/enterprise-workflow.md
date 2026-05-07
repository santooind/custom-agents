# Enterprise Requirement Workflow

## Recommended Agent List

1. Enterprise Requirement Orchestrator
2. Enterprise Requirement Analyst
3. Question Curator
4. Requirement Challenger
5. Business Rule Analyst
6. Integration Analyst
7. Security Privacy Reviewer
8. Data Reporting Analyst
9. Acceptance Criteria QA Analyst
10. Operational Readiness Reviewer
11. Traceability Matrix Agent
12. Executive Summary Writer
13. Final Requirement Freezer

**Why?** Drafting, challenging, specialist review, traceability, and freeze approval are separate responsibilities in enterprise work.

## Folder Structure

```text
requirements/
  raw-input/       # source notes, emails, transcripts, diagram text, drafts
  working-draft/   # editable requirement documents
  questions/       # user/client questions and decisions
  reviews/         # challenger and specialist reviews
  assumptions/     # optional standalone assumption registers
  risks/           # optional standalone risk registers
  traceability/    # goal-to-requirement-to-AC mapping
  frozen/          # immutable frozen requirement baselines
  baselines/       # freeze metadata and approval evidence
  change-log/      # version history
  agents/          # exported copies or team-specific agent variants
```

**Why?** The structure separates evidence, working material, reviews, questions, and frozen baselines.

## End-To-End Workflow

1. User places raw input in `requirements/raw-input/` or pastes it into the enterprise workflow prompt.
2. Enterprise Requirement Analyst creates `requirements/working-draft/<feature-slug>.requirements.md`.
3. Question Curator creates `requirements/questions/<feature-slug>.open-questions.md`.
4. Requirement Challenger writes `requirements/reviews/<feature-slug>.challenge-review.md`.
5. Specialist agents write their review files under `requirements/reviews/`.
6. Enterprise Requirement Analyst updates the working draft from accepted findings.
7. Executive Summary Writer updates the executive summary.
8. Traceability Matrix Agent creates `requirements/traceability/<feature-slug>.traceability.md`.
9. Final Requirement Freezer checks readiness and, after explicit user approval, creates frozen baseline files.

## Workflow Modes

### Light Mode

Use for small/internal features.

Agents:

- Enterprise Requirement Analyst
- Question Curator
- Requirement Challenger
- Acceptance Criteria QA Analyst

Artifacts:

- `requirements/working-draft/<feature-slug>.requirements.md`
- `requirements/questions/<feature-slug>.open-questions.md`
- `requirements/reviews/<feature-slug>.challenge-review.md`
- `requirements/reviews/<feature-slug>.qa-acceptance-review.md`

Escalate to Standard if the draft reveals business rules, integrations, reporting, client impact, sensitive data, SLA, rollout, or production support risk.

**Why?** Light Mode prevents small work from becoming process-heavy.

### Standard Mode

Use for normal client/product requirements.

Agents:

- Enterprise Requirement Analyst
- Question Curator
- Requirement Challenger
- Business Rule Analyst
- Integration Analyst
- Data Reporting Analyst
- Acceptance Criteria QA Analyst
- Traceability Matrix Agent

Artifacts:

- working draft
- open questions
- challenge review
- business rules review
- integration review
- data/reporting review
- QA acceptance review
- traceability matrix

Escalate to Enterprise Freeze if the work is regulated, contractual, security/privacy-sensitive, production-critical, or needs formal baseline approval.

**Why?** Standard Mode covers most real product/client requirement work without forcing governance-only steps.

### Enterprise Freeze Mode

Use for high-risk, client-facing, regulated, contractual, security-sensitive, privacy-sensitive, production-critical, or formal baseline work.

Agents:

- full enterprise agent set

Artifacts:

- full working draft
- all applicable specialist reviews
- executive summary
- traceability matrix
- freeze readiness review
- baseline and frozen copy after explicit approval

**Why?** Freeze Mode is governance-grade and should be reserved for requirements where evidence and approval matter.

### Auto Mode

Use when the user is unsure. The orchestrator chooses the smallest safe mode and explains the classification.

Classify as `Light` when the request is small, internal, low-risk, and not client-contractual.

Classify as `Standard` when it affects normal product/client delivery, business rules, integrations, reporting, data, or QA planning.

Classify as `Enterprise Freeze` when it affects regulated data, formal client signoff, contractual scope, security/privacy, production-critical SLAs, operations, or freeze/baseline approval.

**Why?** Auto Mode keeps the workflow practical while preserving escalation paths.

## Handoff Model

| From | To | Artifact | Purpose |
|---|---|---|---|
| User | Orchestrator | raw input | Start workflow |
| Orchestrator | Analyst | raw input | Create structured draft |
| Analyst | Question Curator | draft assumptions/gaps | Create clear questions |
| Analyst | Challenger | draft | Find gaps and contradictions |
| Challenger | Specialists | review findings | Deep domain review |
| Specialists | Analyst | specialist reviews | Update requirement draft |
| Analyst | Executive Summary Writer | updated draft | Make leadership summary accurate |
| Analyst | Traceability Matrix Agent | updated draft | Validate coverage |
| Traceability Matrix Agent | Final Requirement Freezer | traceability and draft | Decide freeze readiness |

## File Ownership

| Artifact | Primary Writer | Reviewers |
|---|---|---|
| `working-draft/*.requirements.md` | Enterprise Requirement Analyst | all specialists |
| `questions/*.open-questions.md` | Question Curator | all agents |
| `reviews/*.challenge-review.md` | Requirement Challenger | Orchestrator |
| `reviews/*.business-rules-review.md` | Business Rule Analyst | Analyst |
| `reviews/*.integration-review.md` | Integration Analyst | Architect/Security |
| `reviews/*.security-privacy-review.md` | Security Privacy Reviewer | Analyst |
| `reviews/*.data-reporting-review.md` | Data Reporting Analyst | Security/QA |
| `reviews/*.qa-acceptance-review.md` | Acceptance Criteria QA Analyst | Traceability |
| `reviews/*.operational-readiness-review.md` | Operational Readiness Reviewer | Analyst |
| `traceability/*.traceability.md` | Traceability Matrix Agent | Freezer |
| `frozen/*.requirements.v*.md` | Final Requirement Freezer | no direct edits |

## Avoiding Circular Edits

- One primary writer owns each artifact.
- Review agents write findings into `requirements/reviews/` instead of directly rewriting the main draft unless explicitly asked.
- The analyst reconciles accepted review findings into the working draft.
- The freezer copies a reviewed draft into `requirements/frozen/`; it does not rewrite scope while freezing.

**Why?** This keeps review comments from becoming invisible edits.

## Version History

- Use semantic requirement versions: `v0.1`, `v0.2`, `v1.0`.
- Drafts stay in `requirements/working-draft/`.
- Frozen versions use `requirements/frozen/<feature-slug>.requirements.v1.0.md`.
- Every meaningful change goes into `requirements/change-log/<feature-slug>.change-log.md`.
- Never edit a frozen baseline in place.

## When To Ask The User

Ask the user when the missing answer affects:

- scope,
- priority,
- business rule,
- SLA,
- cost,
- implementation sequence,
- security/privacy/compliance,
- integration contract,
- data source of truth,
- retention,
- reporting metric definition,
- rollout or rollback,
- acceptance criteria outcome.

## Ready To Freeze

A document is ready to freeze when:

- all freeze-blocking questions are answered,
- `Critical` and `High` findings are resolved or explicitly accepted,
- all `Must` requirements have acceptance criteria,
- traceability has no orphan `Must` requirements,
- specialist reviews are complete,
- approval owners are recorded.

## Example Codex Workflow

```text
Use the Enterprise Requirement Orchestrator.

Raw input is in requirements/raw-input/client-notes.md.
Create a complete enterprise requirement package.
Run analyst, challenger, specialist reviews, question curation, traceability, and freeze readiness.
Do not freeze until I explicitly approve.
```

## Example Copilot Prompt

```text
/enterprise-requirement-workflow
```

Other prompts:

```text
/light-requirement-workflow
/standard-requirement-workflow
/freeze-requirement
```
