#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"

if [ ! -e "$TARGET" ]; then
  echo "Target not found: $TARGET"
  exit 2
fi

patterns=(
  "vault_kv_secret"
  "vault_generic_secret"
  "data \"vault_"
  "terraform output -raw"
  "nonsensitive("
  "password ="
  "secret ="
  "token ="
  "private_key ="
)

found=0
for pattern in "${patterns[@]}"; do
  matches="$(grep -RIn --include='*.tf' --include='*.tfvars' --include='*.hcl' "$pattern" "$TARGET" 2>/dev/null || true)"
  if [ -n "$matches" ]; then
    echo "Potential secret boundary concern: $pattern"
    echo "$matches"
    found=1
  fi
done

if [ "$found" -ne 0 ]; then
  echo "Review required: ensure Terraform does not read, write, output, or persist static secret payloads."
  exit 1
fi

echo "No obvious Terraform static-secret boundary concerns found in: $TARGET"
