# Shared Enterprise Architecture Review Checklist

## Scope And Context

- [ ] Problem, goals, non-goals, and constraints are clear.
- [ ] Stakeholders and decision owners are identified or questioned.
- [ ] Current state and future state are understandable.

## Architecture Quality

- [ ] Components have responsibility, owner, and dependencies.
- [ ] System boundaries and trust boundaries are explicit.
- [ ] Major decisions have ADRs.
- [ ] Assumptions and open questions are separated.
- [ ] Diagrams match the written architecture.

## Integration And Data

- [ ] Integrations have source, target, contract, auth, owner, and failure handling.
- [ ] Data flows include source of truth, classification, retention, and access control.
- [ ] Reporting and analytics implications are understood.

## Security, Privacy, And Operations

- [ ] IAM, secrets, encryption, audit, and abuse cases are reviewed.
- [ ] Terraform does not manage long-lived static secret payloads or expose them through state/plans/logs.
- [ ] Resilience, observability, support, incident response, rollout, and rollback are reviewed.

## Cost And Governance

- [ ] Cost drivers and licensing assumptions are identified.
- [ ] Governance, approvals, policy, tagging, and ownership are reviewed.

## Freeze Readiness

- [ ] Critical/high findings are resolved or explicitly accepted.
- [ ] Freeze-blocking questions are answered.
- [ ] Traceability has no orphan critical components or integrations.
- [ ] Approval owners are recorded.

**Why?** A shared checklist keeps architecture review consistent across agents.
