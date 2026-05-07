# Enterprise HashiCorp Vault Workflow

## Recommended Agent List

1. Enterprise Vault Orchestrator
2. Vault Discovery Architect
3. Vault Question Curator
4. Vault Architecture Challenger
5. Vault Identity Policy Architect
6. Vault Secret Lifecycle Architect
7. Vault Platform Integration Architect
8. Vault Security Compliance Reviewer
9. Vault Operations Resilience Reviewer
10. Vault Migration Cutover Planner
11. Vault Test Automation Agent
12. Vault Implementation Agent
13. Vault Release Freezer

**Why?** Vault adoption is part architecture, part security, part operations, and part migration.

## Folder Structure

```text
vault/
  raw-input/       # source notes, target paths, platform constraints
  discovery/       # metadata-only current-state discovery
  design/          # lifecycle and platform integration design
  policies/        # identity, namespace, auth, and policy design
  implementation/  # implementation and migration/cutover plans
  tests/           # test plans and validation evidence
  questions/       # user/security/platform questions
  reviews/         # challenger and security reviews
  risks/           # optional risk register
  operations/      # monitoring, audit, runbooks, resilience
  release/         # release readiness reviews
  frozen/          # immutable release baselines
  baselines/       # approval evidence
  change-log/      # version history
  context/         # shared memory: platform standards, path conventions
  agents/          # exported or team-specific agent variants
```

**Why?** Document-based memory is safer and more auditable than hidden agent memory for Vault work.

## Workflow Modes

### Light Mode

Use for metadata-only discovery or low-risk internal assessment.

Agents:

- Vault Discovery Architect
- Vault Question Curator
- Vault Architecture Challenger

Artifacts:

- `vault/discovery/<app-slug>.discovery.md`
- `vault/questions/<app-slug>.open-questions.md`
- `vault/reviews/<app-slug>.challenge-review.md`

No implementation changes.

### Standard Mode

Use for normal application Vault adoption planning.

Agents:

- Vault Discovery Architect
- Vault Question Curator
- Vault Architecture Challenger
- Vault Identity Policy Architect
- Vault Secret Lifecycle Architect
- Vault Platform Integration Architect
- Vault Test Automation Agent

Artifacts:

- discovery
- identity/policy design
- secret lifecycle design
- platform integration design
- test plan and validation automation

Implementation requires explicit approval.

### Enterprise Release Mode

Use for production rollout, regulated data, privileged access, client-facing commitments, cross-team migration, or formal release approval.

Agents:

- full enterprise Vault agent set

Artifacts:

- full discovery and design package
- specialist reviews
- migration/cutover plan
- operations/resilience plan
- security/compliance review
- release readiness review
- frozen baseline after explicit approval

### Auto Mode

Use when unsure. The orchestrator chooses the smallest safe mode and explains why.

## Handoff Model

| From | To | Artifact | Purpose |
|---|---|---|---|
| User | Orchestrator | target path/raw input | Start workflow |
| Orchestrator | Discovery Architect | raw input/codebase | Map current secret handling |
| Discovery Architect | Question Curator | discovery gaps | Create answerable questions |
| Discovery Architect | Challenger | discovery/design | Find unsafe assumptions |
| Challenger | Specialists | review findings | Deep review |
| Specialists | Discovery/Implementation | designs/reviews | Update plan from accepted findings |
| Test Automation | Release Freezer | test evidence | Release readiness |
| Release Freezer | User | readiness review | Ask approval before baseline |

## File Ownership

| Artifact | Primary Writer | Reviewers |
|---|---|---|
| `discovery/*.discovery.md` | Vault Discovery Architect | Challenger |
| `questions/*.open-questions.md` | Vault Question Curator | all agents |
| `reviews/*.challenge-review.md` | Vault Architecture Challenger | Orchestrator |
| `policies/*.identity-policy-design.md` | Vault Identity Policy Architect | Security |
| `design/*.secret-lifecycle.md` | Vault Secret Lifecycle Architect | Operations |
| `design/*.platform-integration.md` | Vault Platform Integration Architect | Testing/Security |
| `operations/*.operations-resilience.md` | Vault Operations Resilience Reviewer | Release Freezer |
| `implementation/*.migration-cutover.md` | Vault Migration Cutover Planner | Operations/Testing |
| `release/*.release-readiness.md` | Vault Release Freezer | all specialists |
| `frozen/*` | Vault Release Freezer | no direct edits |

## When To Ask The User

Ask when the missing answer affects:

- auth method,
- namespace,
- mount/path convention,
- policy scope,
- token TTL or renewal,
- CI/CD identity,
- static secret ownership,
- rotation,
- break-glass,
- audit evidence,
- compliance,
- deployment platform,
- rollback,
- release readiness.

## Ready For Release

Vault adoption is ready for release when:

- no live secret values appear in artifacts,
- secret boundary scans pass,
- auth and policy design are reviewed,
- secret lifecycle and rotation are owned,
- platform integration behavior is validated,
- security/compliance review is complete,
- operations/runbooks/rollback are ready,
- test automation and evidence are present,
- release blockers are answered,
- approvals are recorded.

## Prompt Commands

```text
/light-vault-workflow
/standard-vault-workflow
/enterprise-vault-workflow
/vault-release-readiness
```
