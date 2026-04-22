# Code Review Notes

## Issues Identified
- Flask development server replaced by Gunicorn
- hardcoded secret removed from deployment manifest value
- image moved to ECR
- ingress implemented with AWS Load Balancer Controller using IRSA

## Remaining Improvements
- move secret to AWS Secrets Manager via External Secrets
- add network policy enforcement validation
- add richer structured app logging
- add CI workflow for Terraform plan and image scanning
