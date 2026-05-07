# Sample Raw Input

Analyze this application and make it ready for HashiCorp Vault.

- Current application path: `../my-application`
- Goal: remove static secrets from `.env`, Kubernetes manifests, CI variables, and application config.
- Preferred runtime: Kubernetes.
- Preferred pattern: let the architect decide after discovery.
- Constraints:
  - Do not expose secret values in documentation.
  - Keep local development simple.
  - Terraform may create Vault policies and auth roles, but must not write secret payload values.
  - Create implementation plan, code/config changes, test cases, and validation automation.
