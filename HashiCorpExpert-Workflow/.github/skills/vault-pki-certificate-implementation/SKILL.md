---
name: vault-pki-certificate-implementation
description: "Implement approved Vault PKI or certificate delivery changes for TLS, mTLS, keystores, and truststores."
argument-hint: "[approved migration plan and certificate-loading files]"
---

# Vault PKI Certificate Implementation

## Applicability

Use when the migration plan includes certificates, private keys, mTLS, truststores, keystores, or Vault PKI.

## Approved Changes

May update approved files for:

- certificate mount paths
- truststore/keystore configuration placeholders
- Vault Agent or CSI rendered certificate paths
- renewal and restart notes
- tests for trust chain validation

## Do Not

- Do not print or store certificate private keys.
- Do not include certificate bodies unless they are public test fixtures and approved.
- Do not change TLS trust behavior without explicit scope.

## Implementation Guidance

- Treat certificate loading as runtime-sensitive.
- Validate file permissions, ownership, and refresh behavior.
- Add rollback to previous certificate source.

