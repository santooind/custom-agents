---
name: vault-kubernetes-discovery
description: "Discover Kubernetes, OpenShift, Helm, Secret references, service accounts, and Vault injection opportunities."
argument-hint: "[target repository path]"
---

# Vault Kubernetes Discovery

## Applicability

Run when manifests may exist. Always perform a lightweight check.

## Scan Procedure

1. Detect Kubernetes/OpenShift files:
   - `Deployment`
   - `StatefulSet`
   - `DaemonSet`
   - `Job`
   - `CronJob`
   - `Route`
   - `DeploymentConfig`
   - Helm `Chart.yaml` and `templates/`
2. Detect secret usage:
   - `kind: Secret`
   - `secretKeyRef`
   - `envFrom.secretRef`
   - mounted secrets
   - image pull secrets
3. Detect identity:
   - service accounts
   - projected tokens
   - namespace
   - RBAC
4. Detect Vault readiness:
   - Vault Agent Injector annotations
   - CSI Secret Store resources
   - External Secrets Operator
   - Argo CD or Flux sync

## Recommendation Signals

- Kubernetes workloads favor Kubernetes Auth with Vault Agent Injector or CSI.
- Helm-heavy apps need chart-level change impact.
- OpenShift may require SCC and namespace-specific validation.

## Output

Return deployment model, secret handling, infrastructure changes, and operational risks.

