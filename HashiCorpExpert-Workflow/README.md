# HashiCorpExpert Workflow

GitHub Copilot custom agent workflow pack for enterprise HashiCorp advisory work.

## Vault Discovery Agent

The initial workflow in this pack is the **Vault Discovery Agent**, a read-only discovery agent for generating standardized Vault migration planning reports across large enterprise application portfolios.

Invoke it with:

```text
/vault-discovery-agent
```

Primary files:

- `.github/agents/vault-discovery-agent.agent.md`
- `.github/prompts/vault-discovery-agent.prompt.md`
- `.github/skills/vault-*/SKILL.md`
- `.github/instructions/vault-discovery-report.instructions.md`
- `schemas/vault-discovery-report.schema.json`
- `docs/vault-discovery-agent-architecture.md`
- `examples/vault-discovery-report.md`
- `examples/vault-discovery-report.json`

The agent is intentionally metadata-only. It must not modify target application source code or expose secret values.

The generated report includes a `Code Change Impact Matrix` that identifies likely impacted files, components, current secret retrieval mechanisms, recommended Vault migration changes, complexity, runtime risk, testing impact, and confidence.

## Vault Pattern Selection Agent

After discovery, run the **Vault Pattern Selection Agent** to choose the target Vault integration pattern.

Invoke it with:

```text
/vault-pattern-selection
```

Input:

- `reports/vault-discovery-report.md`
- `reports/vault-discovery-report.json`

Output:

- `reports/vault-pattern-decision.md`

The pattern decision ranks the best target pattern as rank 1 and the fallback or phased option as rank 2. It evaluates patterns such as Vault Agent, Vault Agent Injector, Vault CSI, Sidecar, SDK integration, direct Vault API integration, AppRole, Kubernetes Auth, OIDC/JWT, Dynamic Secrets, Static KV, External Secret Sync, and Vault PKI.

## Vault Migration Plan Agent

After discovery and pattern selection, run the **Vault Migration Plan Agent** to create an implementation-ready plan.

Invoke it with:

```text
/vault-migration-plan
```

Inputs:

- `reports/vault-discovery-report.md`
- `reports/vault-discovery-report.json`
- `reports/vault-pattern-decision.md`

Outputs:

- `reports/vault-migration-plan.md`
- `reports/vault-migration-plan.json`

The migration plan defines secret mapping, code/config changes, infrastructure changes, CI/CD changes, implementation sequence, minimum tests, rollback, cutover, risks, open questions, and readiness. It remains planning-only and must not modify application source code.

## Vault Implementation Agent

After the migration plan is reviewed, run the **Vault Implementation Agent**.

Invoke it with:

```text
/vault-implementation
```

Inputs:

- `reports/vault-discovery-report.md`
- `reports/vault-discovery-report.json`
- `reports/vault-pattern-decision.md`
- `reports/vault-migration-plan.md`
- `reports/vault-migration-plan.json`

Output:

- `reports/vault-implementation-summary.md`
- optional `reports/vault-implementation-summary.json`

The implementation agent is approval-gated. By default, it performs a dry-run scope review. After explicit approval, it uses pattern-specific skills such as Vault Agent Injector, CSI, Java Spring SDK, AppRole, Kubernetes Auth, Dynamic Database Secrets, KV, Helm, CI/CD, PKI, Docker Vault Agent, and Terraform Vault metadata implementation.

## Vault Test & Validation Agent

After implementation, run the **Vault Test & Validation Agent** to validate affected flows and collect evidence.

Invoke it with:

```text
/vault-test-validation
```

Inputs:

- `reports/vault-discovery-report.md`
- `reports/vault-pattern-decision.md`
- `reports/vault-migration-plan.md`
- `reports/vault-implementation-summary.md`
- current git diff

Outputs:

- `reports/vault-test-validation-report.md`
- `reports/vault-test-validation-report.json`

The validation agent identifies impacted files, affected runtime/business flows, minimum safe test scope, tests executed, tests not executed, blocked tests, Vault-specific checks, merge readiness, required manual validation, and risk-based recommendation. It must not fake test success or expose secrets.

It uses pattern-specific testing skills for Vault Agent Injector, CSI, SDK/API, AppRole, Kubernetes Auth, dynamic database secrets, Spring startup, and CI/CD validation. It also generates a manual validation checklist because enterprise Vault migrations cannot rely on automation alone.

## Vault Security Review Agent

After test validation, run the **Vault Security Review Agent** as the final pre-human-approval gate.

Invoke it with:

```text
/vault-security-review
```

Inputs:

- `reports/vault-discovery-report.md`
- `reports/vault-pattern-decision.md`
- `reports/vault-migration-plan.md`
- `reports/vault-implementation-summary.md`
- `reports/vault-test-validation-report.md`
- current git diff

Outputs:

- `reports/vault-security-review.md`
- `reports/vault-security-review.json`

The security review checks whether the Vault migration is safe before merge: no committed secret values, no secrets logged, safe auth method, least-privilege policy considered, rollback path, safe error handling, safe token/lease handling, CI/CD boundaries, and Terraform state boundaries.

## Hooks And Safety Checks

This workflow also includes deterministic hooks and scripts:

- `.github/hooks/vault-agentic-workflow-audit.json`
- `.github/hooks/vault-discovery-report-lint.json`
- `.github/hooks/vault-pattern-decision-lint.json`
- `.github/hooks/vault-migration-plan-lint.json`
- `.github/hooks/vault-implementation-safety.json`
- `.github/hooks/vault-test-validation-lint.json`
- `.github/hooks/vault-security-review-lint.json`

Scripts are available in both Bash and PowerShell under `scripts/`.

They validate artifact handoffs, required Markdown sections, JSON structure, secret redaction, and implementation safety boundaries. See [vault-hooks-and-safety.md](docs/vault-hooks-and-safety.md).
