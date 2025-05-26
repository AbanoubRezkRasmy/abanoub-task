#!/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm upgrade --install keycloak bitnami/keycloak \
  --namespace default \
  --create-namespace \
  -f keycloak-values.yaml

