#!/bin/bash

set -e

# TODO: update default when deploying to production
HELM_REPO_URL="${HELM_REPO_URL:-https://charts.gotway-v2.duckdns.org}"
CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")

echo "☸️  Starting helm chart release for '$HELM_REPO_URL' repository"

echo "☸️  Updating repos..."
helm repo add gotway $HELM_REPO_URL
helm repo update

for path in $(ls -d $CURRENT_DIR/../charts/*); do
  name=$(basename "$path")
  echo "📦 Releasing '$name'..."
  helm dep update "$path"
  helm cm-push "$path" gotway
done
