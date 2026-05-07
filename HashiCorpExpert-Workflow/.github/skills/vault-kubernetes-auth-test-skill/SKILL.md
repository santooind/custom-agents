---
name: vault-kubernetes-auth-test-skill
description: "Validate Kubernetes Auth assumptions, service account alignment, namespace, role binding, and lower-environment auth tests."
argument-hint: "[migration plan, implementation summary, Kubernetes manifests]"
---

# Vault Kubernetes Auth Test Skill

## Applicability

Use when the selected auth method is Kubernetes Auth.

## Test Focus

- service account name alignment
- namespace alignment
- Vault role reference documented
- auth mount path documented
- token audience/issuer requirements noted
- no Kubernetes token is committed

## Safe Automated Checks

- manifest search for service account reference
- Helm render when available
- redaction scan

## Manual Validation Required

- [ ] Service account exists in target namespace.
- [ ] Vault role binds exact service account and namespace.
- [ ] Pod can authenticate to Vault.
- [ ] Auth failure mode is validated.

