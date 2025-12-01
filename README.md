# AWS 3-Tier Web Application Deployment

## 1. Project Overview
This project demonstrates the design and deployment of a **scalable, secure, and highly available 3-tier web application architecture** on AWS using Terraform.  
The architecture includes:

- **Web Tier (Tier-1)**: Public-facing EC2 instances behind an Application Load Balancer (ALB) to handle incoming HTTP requests.  
- **Application Tier (Tier-2)**: Private EC2 instances with Auto Scaling Group (ASG) to host backend application logic.  
- **Database Tier (Tier-3)**: Amazon RDS MySQL instance in a private subnet for secure data storage.  
- **S3**: Static asset storage (images, CSS, JS).  
- **Terraform**: Fully automated Infrastructure as Code (IaC) deployment.

**Key Components:**

| Tier | Components | Subnet Type | Security |
|------|------------|-------------|---------|
| Web  | EC2 + ALB  | Public      | ALB Security Group: HTTP (80) open to Internet |
| App  | EC2 (ASG) | Private     | App Security Group: Allow traffic from ALB only |
| DB   | RDS MySQL | Private     | DB Security Group: Allow traffic from App tier only |

---

## 2. VPC & Networking
- **VPC CIDR**: `10.0.0.0/16`  
- **Subnets**:  
  - Public: `10.0.1.0/24`  
  - Private App: `10.0.2.0/24`  
  - Private DB: `10.0.3.0/24`  
- **Internet Gateway**: Connected to public subnet  
- **Route Tables**: Public subnet routed to IGW  
- **Security**:  
  - Security Groups for tier-specific traffic  
  - NACLs (if used) for additional subnet-level control

---

## 3. Application Deployment
- **Web Tier**: EC2 instances running static content (`index.html`)  
- **App Tier**: EC2 instances running backend application (`Flask` or `Python API`)  
- **Auto Scaling**: Ensures high availability & scalability based on load  
- **ALB**: Distributes incoming traffic to App tier  

---

## 4. Database Tier
- **RDS MySQL**: Multi-AZ deployment recommended for production  
- **Private subnet**: Ensures database not exposed to public internet  
- **Security**: Only App tier can access database

---

## 5. Storage
- **S3 Bucket**: Stores static assets  
- **Bucket Policy**: Public read for frontend content, private for sensitive files

---

## 6. Automation & Terraform
- **Terraform** used to provision all resources automatically:  
  - VPC, Subnets, Route Tables, IGW  
  - Security Groups  
  - EC2 instances + ASG  
  - ALB & Target Groups  
  - RDS database  
  - S3 bucket  
- **Version controlled** in GitHub for reproducibility

---

## 7. Deployment Steps
```bash
cd terraform-3tier
terraform init
terraform plan
terraform apply
