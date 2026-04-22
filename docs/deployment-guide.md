# Deployment Guide

## Local Development
- create `.env`
- run `docker compose up --build`
- test `/health`

## Push to ECR
- authenticate Docker to ECR
- tag image
- push image

## Provision Infrastructure
- `terraform init`
- `terraform plan`
- `terraform apply`

## Connect to EKS
- `aws eks update-kubeconfig`
- `kubectl get nodes`

## Deploy Application
- apply namespace
- apply deployment
- apply service
- apply ingress

## Verify
- `kubectl get pods -n app`
- `kubectl get ingress -n app`
- curl public `/health`
