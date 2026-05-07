---
name: vault-auth-pattern-discovery
description: "Discover application authentication patterns relevant to Vault auth method and secret migration planning."
argument-hint: "[target repository path]"
---

# Vault Auth Pattern Discovery

## Applicability

Always run a lightweight check.

## Scan Procedure

Detect:

- Basic auth
- API keys
- certificates and mTLS
- OAuth/OIDC
- JWT
- LDAP/Active Directory
- Kerberos
- service accounts
- cloud IAM workload identity
- Kubernetes service accounts

## Analysis

Map each pattern to:

- current credential location
- rotation implication
- Vault auth method candidate
- operational owner
- blast radius

## Recommendation Signals

- Kubernetes service account: Kubernetes Auth.
- CI/CD identity token: OIDC/JWT.
- VM or batch process without workload identity: AppRole plus wrapped secret-id delivery.
- Existing OIDC workload support: OIDC/JWT where feasible.

