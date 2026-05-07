---
name: vault-certificate-discovery
description: "Discover certificate, keystore, truststore, mTLS, and private-key handling patterns safely."
argument-hint: "[target repository path]"
---

# Vault Certificate Discovery

## Applicability

Always run a lightweight check.

## Scan Procedure

Detect metadata for:

- `.pem`
- `.crt`
- `.cer`
- `.key`
- `.p12`
- `.pfx`
- `.jks`
- truststore
- keystore
- mTLS
- client certificate auth
- certificate mount paths

## Safety

Never print certificate contents or private key contents.

Evidence should only say:

- file path
- file type
- reference line with value redacted
- likely usage

## Recommendation Signals

- Certificates may map to Vault PKI, static KV, or platform certificate automation.
- Private keys in repo are critical risk and require immediate manual review.

