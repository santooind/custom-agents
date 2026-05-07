---
name: vault-sdk-java-spring-implementation
description: "Implement approved Java/Spring Vault SDK integration with safe config, lease handling, redaction, and tests."
argument-hint: "[approved migration plan and Java/Spring project files]"
---

# Vault SDK Java Spring Implementation

## Applicability

Use when the selected delivery pattern is SDK integration for a Java or Spring application.

## Approved Changes

May update approved files for:

- Maven or Gradle dependencies
- Spring configuration classes
- secret retrieval service abstraction
- configuration properties binding
- test configuration
- unit tests for lookup, failure, and redaction behavior

## Do Not

- Do not hardcode Vault tokens, secret IDs, paths with live values, or secret payloads.
- Do not log returned secret values.
- Do not replace stable config keys unless required and approved.
- Do not introduce SDK integration when Agent/CSI delivery was selected.

## Implementation Guidance

- Prefer a small secret access abstraction instead of scattering Vault calls.
- Use placeholders for Vault address, auth role, mount, and path.
- Handle token/lease renewal where the selected auth method requires it.
- Add clear failure behavior for Vault unavailable, permission denied, and missing key.
- Preserve backward compatibility using existing config keys when possible.

## Validation

Recommend or run:

- build/test command from the repo
- unit tests for lookup and failure handling
- search for accidental secret logging

