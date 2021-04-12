#!/bin/bash

set -e

source ./scripts/common.sh
update_deps

echo "☸️  Loading manifests..."
kubectl apply -f manifests/

for path in $(ls -d charts/*); do
  chart=$(basename "$path")
  echo "🚀 Deploying '${chart}'..."
  helm upgrade --install "$chart" "$path"
done
