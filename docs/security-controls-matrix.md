# Security Controls Matrix

| Control Area | Implementation | Purpose |
|---|---|---|
| Identity | AWS Load Balancer Controller uses IRSA | Limits controller permissions to a dedicated service account instead of broad node-role access |
| Network Segmentation | Public subnets for ALB, private subnets for EKS worker nodes | Reduces direct workload exposure |
| Container Runtime | Gunicorn running inside a Docker container as non-root | Improves production realism and reduces privilege |
| Secret Handling | APP_SECRET injected through Kubernetes Secret | Removes hardcoded secrets from deployment manifest values |
| Image Security | Container image stored in ECR and scanned in CI with Trivy | Detects vulnerable images before promotion |
| Infrastructure as Code | VPC and EKS provisioned with Terraform | Improves repeatability, reviewability, and change control |
| Ingress Security | ALB managed through AWS Load Balancer Controller | Standardized ingress path and AWS-native load balancing |
| Availability | Multiple EKS pods and managed node group across AZs | Improves resilience |
| Observability | Planned Splunk ingestion for app, Kubernetes, and AWS telemetry | Supports detection and investigation |
