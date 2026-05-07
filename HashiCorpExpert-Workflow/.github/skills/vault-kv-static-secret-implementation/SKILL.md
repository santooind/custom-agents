---
name: vault-kv-static-secret-implementation
description: "Implement static KV secret consumption through approved delivery patterns while preserving redaction and rollback."
argument-hint: "[approved migration plan and target config/deployment files]"
---

# Vault KV Static Secret Implementation

## Applicability

Use when KV v1 or KV v2 static secrets are part of the selected target pattern.

## Approved Changes

May update approved files for:

- Vault path placeholders
- rendered config templates
- key name placeholders
- application-compatible config references
- documentation of secret owner and rotation expectations

## Do Not

- Do not write static secret values.
- Do not manage static secret payloads with Terraform.
- Do not remove current secret source before rollback is approved.

## Implementation Guidance

- Prefer KV v2 unless the platform standard says otherwise.
- Keep current property/env names stable when possible.
- Mark proposed paths as placeholders until approved.

