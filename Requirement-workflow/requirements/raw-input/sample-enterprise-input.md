# Sample Enterprise Raw Input

Client wants an SLA dashboard for support managers.

Notes:

- Managers need to see tickets close to SLA breach and already breached.
- Dashboard should include customer tier, ticket owner, queue, severity, created date, due date, and current SLA status.
- Managers want export to CSV.
- Operations wants alerts before breach, but timing is not confirmed.
- Security says only managers and admins should see the dashboard.
- Reporting team says SLA metrics may come from the ticketing platform, but the source of truth is not confirmed.
- Architecture notes mention a possible API from the ticketing system, but rate limits and auth are unknown.
- Client wants it in the next release.

Use this with:

```text
/enterprise-requirement-workflow
```

Expected result:

- working draft in `requirements/working-draft/`
- open questions in `requirements/questions/`
- challenge and specialist reviews in `requirements/reviews/`
- traceability in `requirements/traceability/`
- no frozen baseline until explicit approval.
