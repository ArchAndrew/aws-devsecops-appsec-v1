<p align="center">
  <img src="https://img.shields.io/badge/AWS-EKS-orange" />
  <img src="https://img.shields.io/badge/Kubernetes-Production-blue" />
  <img src="https://img.shields.io/badge/DevSecOps-Enabled-green" />
  <img src="https://img.shields.io/badge/Splunk-SOC-black" />
</p>

<p align="center">
  <b>End-to-End DevSecOps | Kubernetes Security | SOC Detection Engineering</b>
</p>

# AWS EKS DevSecOps AppSec Pipeline with Splunk SOC Detection

<img src= https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/architecture/aws_eks_splunk_diagram.png style="width:1000px;">

---

## 🧠 Think About It

Modern cloud-native applications are often deployed quickly, but not securely.

Security gaps typically occur in two places:

- **Before deployment** (vulnerable container images)
- **After deployment** (lack of runtime visibility and detection)

This project demonstrates how to integrate **preventive security controls (DevSecOps)** with **real-time detection (SOC visibility)** in a Kubernetes environment.

---

## 🏗️ Architecture Overview (High-Level)


GitHub → GitHub Actions → Trivy → ECR → Terraform → EKS → ALB → Flask App → Structured Logs → Splunk HEC → SOC Dashboard

- **Docker** → Packages the application securely  
- **GitHub Actions** → Automates CI/CD and security checks  
- **Trivy** → Scans container images for vulnerabilities  
- **Amazon ECR** → Stores container images  
- **Amazon EKS** → Runs the application in Kubernetes  
- **AWS Load Balancer Controller (IRSA)** → Secure ingress  
- **Splunk** → Ingests logs and powers detection dashboards  

---

## 🔄 Pipeline Flow

1. Code is pushed to GitHub  
2. GitHub Actions builds the Docker image  
3. Trivy scans the image for HIGH/CRITICAL vulnerabilities  
4. Image is pushed to Amazon ECR  
5. Terraform provisions AWS infrastructure (VPC + EKS)  
6. Kubernetes deploys the application  
7. Application emits structured JSON logs  
8. Logs are ingested into Splunk  
9. Detection rules trigger SOC alerts and dashboards  

---

## 🧪 CI/CD Security Validation (Proof)

This pipeline enforces security gates using Trivy.

### ❌ Failed Build (Vulnerabilities Detected)

When HIGH/CRITICAL vulnerabilities are found, the pipeline is automatically stopped.

![Pipeline Failure](https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/Trivy_Failed_Pipeline.png)
![Pipeline Failure](https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/Trivy_Failed_High.png)

- Trivy detected HIGH/CRITICAL CVEs
- Build failed intentionally
- Vulnerable image was NOT pushed to ECR

---

### ✅ Successful Build (Secure Image)

Once vulnerabilities are resolved, the pipeline successfully completes.

![Pipeline Success](https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/Trivy_Fixed.png)

- No HIGH/CRITICAL vulnerabilities detected
- Image pushed to Amazon ECR
- Deployment allowed to proceed

---

### 🔐 Security Enforcement Outcome

- Prevents vulnerable containers from reaching production
- Enforces “shift-left” security in CI/CD
- Demonstrates real-world DevSecOps pipeline behavior

## 🔐 Security Controls

### Pre-Deployment
- Trivy image scanning in CI/CD  
- Build fails on HIGH/CRITICAL vulnerabilities

---

### Runtime
- Auth failure detection  
- IAM anomaly detection  
- Data exfiltration monitoring  
- Admin activity tracking  
- Event spike detection  

---

## 📊 SOC Dashboard (Splunk)

:warning: All attack activity was simulated in a controlled lab environment using mock telemetry.


📄 **Full Dashboard (Recommended View):**  
👉 [View Full SOC Dashboard (PDF)](https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/soc-dashboard.pdf)


| Detection | Signal | Purpose |
|---|---|---|
| Brute Force | Repeated auth failures | Detect credential attacks |
| IAM Anomaly | Same user from multiple IPs | Detect suspicious identity activity |
| Data Exfiltration | High outbound bytes | Detect abnormal data movement |
| Admin Abuse | Privileged Kubernetes actions | Detect risky admin behavior |
| Event Spike | Sudden event volume increase | Detect bursts/scanning |

### Key Panels

#### 🔴 Auth Failures
<img src= "https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/Auth_Failures.png" style="width:1000px;">

#### 🟢 Auth Success
<img src= "https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/Auth_Success.png" style="width:1000px;">

#### 📤 Data Exfiltration
<img src= "https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/Data_Exfiltration.png" style="width:1000px;">

#### 🔐 IAM Anomalies
<img src= "https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/IAM_Anomalies.png" style="width:1000px;">

#### 🌐 Network Activity
<img src= "https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/Network_Activity.png" style="width:1000px;">

#### ⚡ Event Spike Detection
<img src= "https://github.com/ArchAndrew/aws-devsecops-appsec-v1/blob/main/docs/screenshots/Event_Spike_Detection.png" style="width:1000px;">


---

## 🎭 Attack Simulations

The following attack scenarios were simulated against the live environment:

- Repeated failed login attempts (brute force)
- Multi-IP login attempts (credential stuffing behavior)
- Privileged admin actions (cluster role + pod access)
- Data exfiltration patterns (simulated outbound activity)

All activity was captured and visualized in Splunk.

---

## 💰 Cost Optimization

All AWS infrastructure was **fully destroyed after testing** to prevent unnecessary costs.

- ✔ EKS cluster terminated  
- ✔ NAT Gateway removed  
- ✔ Load balancer deleted  
- ✔ No running compute resources  

---

## 🚀 Key Takeaways

- Built a full DevSecOps pipeline from scratch  
- Integrated security into CI/CD workflows  
- Implemented real-time detection and monitoring  
- Simulated real-world attack scenarios  
- Designed a SOC-style dashboard for investigation  

---

# 📚 Technical Deep Dive

---

## 🏗️ Detailed Architecture

This environment includes:

- Dockerized Flask application served by Gunicorn  
- Amazon ECR for image storage  
- Terraform-managed VPC and EKS  
- Kubernetes Deployment, Service, and Ingress  
- AWS Load Balancer Controller using IRSA  
- Public ALB endpoint for access  
- Kubernetes Secret for runtime configuration  

---

## 🔄 Request Flow

Internet
→ AWS Application Load Balancer
→ Kubernetes Ingress
→ Kubernetes Service
→ EKS Pods
→ Gunicorn
→ Flask application

---

## 🧱 Security Controls Matrix

| Control Area            | Implementation                                      | Purpose |
|------------------------|-----------------------------------------------------|--------|
| Identity               | IRSA for ALB Controller                             | Limits IAM permissions |
| Network Segmentation   | Public + Private subnets                            | Reduces exposure |
| Container Runtime      | Gunicorn (non-root)                                 | Hardens execution |
| Secret Handling        | Kubernetes Secrets                                  | Removes hardcoded secrets |
| Image Security         | Trivy scanning in CI                                | Detects vulnerabilities |
| Infrastructure as Code | Terraform                                           | Ensures repeatability |
| Ingress Security       | ALB Controller                                      | Controlled entry point |
| Availability           | Multi-AZ nodes                                      | Improves resilience |
| Observability          | Splunk ingestion                                    | Enables detection |

---

## 🧠 Threat Model

### Assets
- Application container  
- ECR image  
- EKS cluster  
- IAM roles  
- Kubernetes secrets  
- Terraform code  
- ALB ingress  

### Entry Points
- Public ALB endpoint  
- CI/CD pipeline  
- AWS APIs  
- Kubernetes API  

### Key Risks
- Credential misuse  
- Vulnerable images  
- Excessive IAM permissions  
- Public exposure  
- Lack of visibility  

### Mitigations
- IRSA-based permissions  
- Private subnet workloads  
- ECR-controlled image flow  
- Trivy scanning  
- Kubernetes Secrets  
- Terraform-managed infrastructure  

---

## 📥 Splunk Ingestion Design

### Ingestion Scope
- Application logs  
- Kubernetes events  
- AWS CloudTrail  
- ALB access logs  
- VPC Flow Logs  

### Indexes
- aws_cloudtrail  
- aws_alb  
- aws_vpcflow  
- k8s_app  
- k8s_platform  
- cicd_security  

### Sourcetypes
- aws:cloudtrail  
- aws:alb:accesslogs  
- aws:vpcflow  
- kube:container:app  
- kube:events  
- trivy:json  

---

## 🔍 Detection Engineering

### Brute Force Detection
- Logic: >5 failed logins from same IP within 1 minute  
- Purpose: Detect credential stuffing  

### Admin Targeting
- Logic: Repeated attempts against privileged account  
- Purpose: Identify targeted attacks  

### Auth Spike Detection
- Logic: Sudden increase in login attempts  
- Purpose: Detect scanning or attack bursts  

---

## 🧪 CI/CD Security Validation

- Trivy integrated into GitHub Actions  
- Pipeline fails on HIGH/CRITICAL vulnerabilities  
- Image scanning enforced before deployment  

---

## 🧾 Code Review Notes

### Issues Identified
- Flask dev server replaced with Gunicorn  
- Hardcoded secret removed  
- Image migrated to ECR  
- IRSA-based ingress implemented  

### Remaining Improvements
- Integrate AWS Secrets Manager  
- Add network policy enforcement  
- Improve structured logging  
- Expand CI/CD for Terraform  

---

## 📁 Repository Structure

```bash
app/backend/        # Application code
terraform/          # Infrastructure modules
k8s/base/           # Kubernetes manifests
docs/               # Documentation
splunk/             # Detection + dashboards
.github/workflows/  # CI/CD pipelines
```


---

## 🧪 Deployment Guide (Condensed)

### Local
```bash
create .env
docker compose up --build
```

### Infrastructure
```bash
terraform init
terraform apply
```

### Deploy
```bash
kubectl apply -f k8s/
```

### Verify
```bash
kubectl get pods
kubectl get ingress
curl /health
```

### 📌 Final Note

This project simulates a real-world DevSecOps + SOC environment, combining:

- Secure application delivery
- Cloud-native infrastructure
- Runtime detection engineering
- Operational visibility


thee_architect_was_here
