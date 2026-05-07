---
name: vault-docker-discovery
description: "Discover Docker, Docker Compose, image build, entrypoint, and secret injection patterns."
argument-hint: "[target repository path]"
---

# Vault Docker Discovery

## Applicability

Run when Dockerfile, Compose files, container scripts, or image build pipelines may exist. Otherwise perform a lightweight check.

## Scan Procedure

Detect:

- `Dockerfile`
- `docker-compose.yml`
- build args
- environment variables
- mounted files
- entrypoint scripts
- image labels
- Compose secrets

## Risks

Flag:

- secrets in `ARG` or `ENV`
- generated `.env` files
- credentials in image build commands
- secrets baked into images
- entrypoint logging of environment

## Recommendation Signals

- Container without Kubernetes may use Vault Agent sidecar, init wrapper, rendered file, or AppRole.
- Kubernetes container should be assessed by Kubernetes skill for Injector or CSI.

