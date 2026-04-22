# AWS DevSecOps Application Security Platform (V1)

## Executive Summary
Designed and deployed a production-style AWS DevSecOps application security platform using Terraform and Amazon EKS, featuring secure containerized workloads, ALB ingress, IRSA-based controller permissions, Kubernetes secret handling, and a security-focused delivery workflow.

## Business Problem
Modern cloud-native applications need more than infrastructure deployment. They require secure image handling, controlled ingress, least-privilege access, repeatable infrastructure, and clear visibility into operational and security events. This project demonstrates how to build and expose a containerized application in AWS while applying practical DevSecOps and platform security principles.

## Architecture Overview
This environment includes:
- Dockerized Flask application served by Gunicorn
- Amazon ECR for image storage
- Terraform-managed VPC and EKS
- Kubernetes Deployment, Service, and Ingress
- AWS Load Balancer Controller using IRSA best practice
- Public ALB endpoint for application access
- Kubernetes Secret for sensitive runtime configuration

## Request Flow
Internet  
→ AWS Application Load Balancer  
→ Kubernetes Ingress  
→ Kubernetes Service  
→ EKS Pods  
→ Gunicorn  
→ Flask application

## Key Security Controls
- **Least privilege for controller access:** AWS Load Balancer Controller uses IRSA rather than broad node-role permissions
- **Private workload placement:** EKS worker nodes run in private subnets
- **Container hardening:** application runs in a containerized environment with Gunicorn instead of the Flask development server
- **Secret handling:** `APP_SECRET` is injected through a Kubernetes Secret rather than hardcoded in the deployment manifest
- **Infrastructure as Code:** core infrastructure is provisioned through Terraform for repeatability and change control
- **Ingress standardization:** ALB-managed ingress provides a controlled public entry point

## What I Built
- Containerized backend application
- ECR image publishing flow
- Terraform VPC module
- Terraform EKS module
- Kubernetes Deployment / Service / Ingress
- IRSA-backed ALB controller installation
- Public health endpoint validation
- Security documentation and deployment guide
- Initial CI security workflows

## Validation
The application was validated at multiple stages:
- local Docker health check
- EKS pod health validation
- Kubernetes service port-forward validation
- public ALB `/health` validation

## Repository Structure
- `app/backend/` – application source and container build files
- `terraform/` – Terraform environment and reusable modules
- `k8s/base/` – Kubernetes manifests
- `docs/` – architecture, deployment, and security documentation
- `splunk/` – observability design and detection content
- `.github/workflows/` – CI/CD and security automation

## Documentation
- [Deployment Guide](docs/deployment-guide.md)
- [Security Controls Matrix](docs/security-controls-matrix.md)
- [Threat Model](docs/threat-model.md)
- [Splunk Ingestion Design](docs/splunk-ingestion-design.md)
- [Code Review Notes](docs/code-review-notes.md)

## Current State
This V1 build demonstrates a working public application on AWS EKS with secure ingress and foundational platform security controls. Future improvements include deeper observability integration, AWS Secrets Manager integration, and additional workload-level controls.

## Future Enhancements
- Replace Kubernetes Secret with AWS Secrets Manager via External Secrets
- Add richer structured application logging and Splunk ingestion
- Add Kubernetes network policy enforcement validation
- Add autoscaling and workload tuning
- Expand CI/CD with Terraform plan and deployment automation

## Screenshots
Add screenshots for:
- EKS nodes in `Ready`
- ALB ingress address
- successful public `/health` response
- Terraform apply outputs
- GitHub Actions security workflow results

## License
This project is licensed under the MIT License.
# trigger scan
