---
name: vault-manual-validation-generator
description: "Generate manual validation checklists for Vault migration runtime, security, Kubernetes, and rollback validation."
argument-hint: "[affected flows and selected Vault pattern]"
---

# Vault Manual Validation Generator

## Applicability

Run for every Vault validation.

## Output

Generate a checklist grouped by:

## Startup Validation

- [ ] Application starts successfully.
- [ ] No Vault auth exceptions.
- [ ] No datasource initialization failure.
- [ ] Health/readiness checks pass.

## Runtime Validation

- [ ] API login or primary business flow works.
- [ ] DB operations work.
- [ ] Scheduled jobs execute.
- [ ] Batch jobs execute where applicable.

## Kubernetes Validation

- [ ] Vault injector or CSI configuration is applied.
- [ ] Pod restarts successfully.
- [ ] No `CrashLoopBackOff`.
- [ ] Expected files or mounts exist.

## Security Validation

- [ ] No secrets logged.
- [ ] No secret values exposed in events, pod descriptions, CI logs, or app logs.
- [ ] Vault policy is least privilege.

## Rollback Validation

- [ ] Previous config can restore service.
- [ ] Previous secret source remains available during rollback window.
- [ ] Rollback smoke test passes.

