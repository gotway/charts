#!/bin/bash

set -e

helm plugin install https://github.com/chartmuseum/helm-push.git
helm repo add gotway https://charts.gotway.duckdns.org

source ./scripts/common.sh
update_deps

for path in $(ls -d charts/*); do
  name=$(basename "$path")
  echo "📦 Releasing '${name}'..."
  helm cm-push "$path" gotway
done
