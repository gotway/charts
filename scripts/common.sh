#!/bin/bash

function update_deps() {
  echo "☸️  Updating repos..."
  helm repo add chartmuseum https://chartmuseum.github.io/charts
  helm repo add mmontes https://charts.mmontes-dev.duckdns.org
  helm repo update

  echo "☸️  Updating deps..."
  for ch in $(ls -d charts/*); do
    helm dep update $ch
  done
}
