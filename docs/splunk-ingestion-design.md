# Splunk Ingestion Design

## Ingestion Scope
- application logs
- Kubernetes workload events
- AWS CloudTrail
- ALB access logs
- VPC Flow Logs
- GuardDuty findings (future phase)

## Proposed Indexes
- aws_cloudtrail
- aws_alb
- aws_vpcflow
- k8s_app
- k8s_platform
- cicd_security

## Proposed Sourcetypes
- aws:cloudtrail
- aws:alb:accesslogs
- aws:vpcflow
- kube:container:app
- kube:events
- trivy:json

## Detection Use Cases
- repeated failed login attempts
- admin endpoint abuse
- unusual IAM activity
- suspicious network traffic
