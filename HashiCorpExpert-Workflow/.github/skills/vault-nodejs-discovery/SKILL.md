---
name: vault-nodejs-discovery
description: "Discover Node.js framework, environment variable, package, and secret provider patterns."
argument-hint: "[target repository path]"
---

# Vault Node.js Discovery

## Applicability

Run when repository evidence includes JavaScript, TypeScript, `package.json`, npm/yarn/pnpm lockfiles, Node runtime, Express, NestJS, Next.js, or serverless Node handlers.

## Scan Procedure

1. Inspect manifests for framework and runtime metadata.
2. Detect secret access:
   - `process.env`
   - `dotenv`
   - config libraries
   - runtime config modules
3. Detect providers:
   - `node-vault`
   - AWS Secrets Manager SDK
   - Azure Key Vault SDK
   - GCP Secret Manager SDK
4. Detect deployment shape:
   - Docker
   - Kubernetes
   - serverless
   - PM2/systemd
5. Detect operational risks:
   - config loaded at startup only
   - secret caching
   - env dumps in logs
   - API key middleware

## Output

Return technology stack, secret handling, auth, deployment, and operational-risk findings with masked evidence.

