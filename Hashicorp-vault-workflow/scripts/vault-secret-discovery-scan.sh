#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"

if [ ! -e "$TARGET" ]; then
  echo "Target not found: $TARGET"
  exit 2
fi

if command -v rg >/dev/null 2>&1; then
  RG=(rg -n --hidden --glob '!**/.git/**' --glob '!**/node_modules/**' --glob '!**/vendor/**' --glob '!**/dist/**' --glob '!**/build/**')
else
  echo "This scanner requires ripgrep (rg) for safe, scoped discovery."
  exit 2
fi

redact_output() {
  sed -E \
    -e 's/(([A-Za-z0-9_.-]*(password|passwd|pwd|token|secret|api[_-]?key|private[_-]?key|DATABASE_URL|connectionString)[A-Za-z0-9_.-]*)[[:space:]]*[:=][[:space:]]*)[^[:space:]]+/\1<redacted>/Ig' \
    -e 's/((Authorization|Proxy-Authorization):[[:space:]]*(Bearer|Basic)[[:space:]]+)[^[:space:]]+/\1<redacted>/Ig'
}

echo "Vault discovery scan target: $TARGET"
echo

echo "== Stack indicators =="
rg --files "$TARGET" 2>/dev/null | rg '(^|/)(package.json|pom.xml|build.gradle|requirements.txt|pyproject.toml|go.mod|Cargo.toml|Gemfile|composer.json|Dockerfile|docker-compose.*|Chart.yaml|values.yaml|main.tf|terragrunt.hcl|Jenkinsfile|azure-pipelines.*|.*gitlab-ci.*|.*github/workflows/.*)$' || true
echo

echo "== Secret handling indicators (values redacted; inspect paths and keys only) =="
("${RG[@]}" 'dotenv|VAULT_ADDR|VAULT_TOKEN|vault|AWS_SECRET_ACCESS_KEY|AZURE_CLIENT_SECRET|GOOGLE_APPLICATION_CREDENTIALS|DATABASE_URL|SPRING_DATASOURCE|connectionString|password|passwd|api[_-]?key|secret|private[_-]?key|token' "$TARGET" || true) | redact_output
echo

echo "== Terraform Vault boundary indicators =="
("${RG[@]}" 'vault_(kv_secret|generic_secret)|data[[:space:]]+"vault_|nonsensitive\(|sensitive[[:space:]]*=' "$TARGET" || true) | redact_output
echo

echo "Discovery scan completed. Do not copy live secret values into documents."
