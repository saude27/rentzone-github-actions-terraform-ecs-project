# 🚀 CI/CD Pipeline with GitHub Actions, Terraform, and AWS

This project demonstrates how to build an automated CI/CD pipeline using **GitHub Actions** to provision and manage infrastructure on **AWS** with **Terraform**, build Docker images, and deploy to **Amazon ECS Fargate**.

---

## 🧱 Project Overview

The pipeline consists of:
- Terraform for Infrastructure as Code (IaC)
- GitHub Actions for Continuous Integration and Deployment
- AWS services including:
  - S3 and DynamoDB for remote Terraform state management
  - Secrets Manager for storing sensitive data
  - Amazon ECR for Docker images
  - Amazon ECS (Fargate) for container orchestration

---

## 🛠️ Infrastructure Setup

### 1. AWS Preparation
- Set up and configured an AWS account.
- Created an **S3 bucket** to store Terraform state files.
- Created a **DynamoDB table** for state locking.
- Stored necessary secrets in **AWS Secrets Manager**.

### 2. Terraform Configuration
- Wrote and tested Terraform code locally.
- Updated `backend` block to reference the S3 bucket and DynamoDB table.
- Ran `terraform init` and `terraform apply` to validate the setup.

---

## 📁 GitHub Repository Setup

### 3. Repository Configuration
- Created a new **GitHub repository** and cloned it locally.
- Added Terraform files to the repo.
- Committed and pushed the code to GitHub.

### 4. GitHub Secrets
Added the following secrets to the GitHub repository:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- Any additional secrets for ECS or custom needs

---

## ⚙️ GitHub Actions Workflow

Created a **GitHub Actions workflow** to automate deployment steps. The workflow includes the following jobs:

### ✅ 1. Configure AWS Credentials
- Uses `aws-actions/configure-aws-credentials` to authenticate with AWS.

### 🏗️ 2. Deploy Infrastructure (Terraform Apply)
- Runs `terraform init`, `terraform plan`, and `terraform apply` to provision resources.

### 💣 3. Destroy Infrastructure (Terraform Destroy)
- Provides a job to clean up the infrastructure using `terraform destroy`.

### 🐳 4. Create Amazon ECR Repository
- Automates the creation of an ECR repository using AWS CLI.

### 🧑‍💻 5. Start Self-Hosted Runner
- Boots up a self-hosted GitHub Actions runner for Docker builds.

### 🔧 6. Build Docker Image
- Builds a Docker image and pushes it to Amazon ECR.

### 🛑 7. Stop Self-Hosted Runner
- Shuts down the self-hosted runner after the build process is complete.

### 🧱 8. Create New ECS Task Definition
- Registers a new task definition revision for ECS Fargate deployment.

### 🔄 9. Restart ECS Fargate Service
- Restarts the ECS service to pick up the new Docker image.


