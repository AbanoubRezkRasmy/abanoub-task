Based on the codebase context, you're asking for a README file in GitHub format for the `AbanoubRezkRasmy/abanoub-task` repository, which contains a Flask application with Keycloak authentication deployed on AWS EKS.

# Flask App with Keycloak Authentication on AWS EKS

A cloud-native Flask application with OpenID Connect authentication using Keycloak, deployed on Amazon EKS with OAuth2-Proxy as an authentication gateway.

## Architecture Overview

The system consists of three main components deployed on AWS EKS:

- **Flask Application**: Main business application [1](#0-0) 
- **Keycloak**: Identity provider and user management [2](#0-1) 
- **OAuth2-Proxy**: Authentication gateway [3](#0-2) 

All components share a common AWS Application Load Balancer for external access and SSL termination.

## Deployment

### Prerequisites

- AWS EKS cluster
- Helm 3.x
- kubectl configured for your cluster

### Components

#### 1. Flask Application
```bash
helm install flask-app ./flask-app/flask-app/
```

Configuration: [4](#0-3) 

#### 2. Keycloak
```bash
helm install keycloak bitnami/keycloak -f keycloak-setup/values.yaml
```

Default admin credentials: [5](#0-4) 

#### 3. OAuth2-Proxy
```bash
helm install oauth2-proxy oauth2-proxy/oauth2-proxy -f oauth2-proxy/oauth2-proxy-values.yaml
```

## Infrastructure Configuration

### AWS Load Balancer
All components use shared ALB configuration: [6](#0-5) 

SSL Certificate: [7](#0-6) 

### Resource Allocation
- **Flask App**: [8](#0-7) 
- **Keycloak**: [9](#0-8) 

## Authentication Flow

1. User accesses `app.datavisyn.pro`
2. OAuth2-Proxy redirects to Keycloak for authentication
3. After successful login, user is redirected back to the Flask application
4. OAuth2-Proxy validates tokens and forwards authenticated requests

OIDC Configuration: [10](#0-9) 

## Development

### Local Development
The PostgreSQL persistence is disabled for development: [11](#0-10) 

### Scaling
Autoscaling is currently disabled: [12](#0-11) 

## Security

- SSL termination at ALB level
- OIDC authentication via Keycloak
- OAuth2-Proxy as authentication gateway
- Security groups and VPC configuration for network isolation

## Notes

This README is generated based on the Helm chart configurations and deployment manifests in the repository. The system uses a microservices architecture with separate Helm charts for each component, all sharing common AWS infrastructure annotations for consistent routing and SSL configuration.

Wiki pages you might want to explore:
- [System Architecture (AbanoubRezkRasmy/abanoub-task)](/wiki/AbanoubRezkRasmy/abanoub-task#2)
