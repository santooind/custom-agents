---
name: docker-vault-agent-implementation
description: "Implement approved Docker or non-Kubernetes Vault Agent integration through startup wrappers, rendered files, or sidecar patterns."
argument-hint: "[approved migration plan and Docker/startup files]"
---

# Docker Vault Agent Implementation

## Applicability

Use for Docker, Docker Compose, VM container, sidecar, or startup wrapper Vault Agent patterns outside Kubernetes Injector/CSI.

## Approved Changes

May update approved files for:

- Docker Compose sidecar service placeholders
- Dockerfile startup wrapper hooks
- entrypoint scripts
- Vault Agent config placeholders
- mounted rendered config paths

## Do Not

- Do not bake secrets into images.
- Do not pass secrets as Docker build args.
- Do not add Vault tokens or AppRole secret IDs.
- Do not echo environment variables in startup scripts.

## Implementation Guidance

- Keep image build secret-free.
- Render secrets at runtime only.
- Preserve existing entrypoint behavior.
- Add safe failure behavior when Vault-rendered files are missing.

