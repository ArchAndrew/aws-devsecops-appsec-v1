# Threat Model

## Assets
- application container
- ECR image
- EKS cluster
- IAM roles
- Kubernetes Secret
- Terraform code
- ALB ingress path

## Entry Points
- public ALB endpoint
- CI/CD pipeline
- AWS console/API
- Kubernetes API

## Key Risks
- credential misuse
- vulnerable container image
- excessive IAM permissions
- public exposure of workload
- log blind spots

## Mitigations
- IRSA for controller permissions
- private worker-node subnets
- ECR-backed image flow
- Trivy image scanning
- Kubernetes Secret for app secret
- Terraform-managed infrastructure
