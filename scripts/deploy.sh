#!/bin/bash

set -e

source ./scripts/common.sh
update_deps

echo "☸️  Creating namespaces..."
kubectl apply -f manifests/namespaces

echo "☸️  Creating secrets..."
kubectl apply -f manifests/secrets

echo "🚀 Deploying chartmuseum..."
helm upgrade gotway-charts charts/gotway-charts --install --namespace chartmuseum

echo "🚀 Deploying gotway..."
helm upgrade gotway charts/gotway --install --namespace gotway