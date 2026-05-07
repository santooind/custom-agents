---
name: vault-agent-injector-test-skill
description: "Define and run safe validation for Vault Agent Injector annotations, rendered templates, and pod startup risk."
argument-hint: "[migration plan, implementation summary, manifests or Helm chart]"
---

# Vault Agent Injector Test Skill

## Applicability

Use when the selected pattern includes Vault Agent Injector.

## Test Focus

- injector annotations exist on pod template metadata
- Vault role annotation is present and placeholder-safe
- rendered template destination is documented
- injected file path matches application config expectation
- no secret values are embedded in annotations or templates
- lower-environment pod startup validation is listed

## Safe Automated Checks

Run only when local files/tooling exist:

- YAML syntax check
- `helm template`
- redaction scan
- manifest grep for injector annotations

## Manual Validation Required

- [ ] Pod starts without `CrashLoopBackOff`.
- [ ] Vault Agent sidecar/init container completes successfully.
- [ ] Injected file exists at expected path.
- [ ] Application reads injected config.
- [ ] No secret values appear in pod logs.

