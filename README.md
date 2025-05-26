# 🚀 Cloud Native Three-Tier Application (DevOps BootCamp Capstone)

This project is the final capstone for the **DevOps BootCamp 2025**. It demonstrates a complete DevOps workflow by architecting and deploying a highly scalable, highly available cloud-native three-tier application using Kubernetes on Azure.

---

## 📚 Table of Contents
- [🎯 Project Overview](#-project-overview)
- [🧱 Tech Stack](#-tech-stack)
- [🗂️ Project Structure](#️-project-structure)
- [🚀 How to Deploy](#-how-to-deploy)
- [⚙️ CI/CD Pipeline](#️-cicd-pipeline)
- [📡 Monitoring](#-monitoring)
- [✅ Features](#-features)
- [📖 Lessons Learned](#-lessons-learned)

---

## 🎯 Project Overview

The goal of this project is to **migrate a tightly-coupled Azure-based web application** to a **cloud-native architecture** deployed on Kubernetes (AKS). The application consists of:

- A **frontend** built with Next.js served via Node.js.
- A **backend** built using Express.js.
- A **relational database** hosted on Azure SQL Server.

The project focuses on:
- Infrastructure provisioning via **Terraform**
- Deployment via **Azure DevOps Pipelines**
- Monitoring with **Prometheus** and **Grafana**
- Best practices for **scalability, security, and automation**

---

## 🧱 Tech Stack

### 🧑‍💻 Application
- **Frontend**: Next.js (TypeScript), Tailwind CSS
- **Backend**: Node.js, Express.js
- **Database**: Azure SQL

### ☁️ Infrastructure
- **Platform**: Azure Cloud
- **Container Orchestration**: Kubernetes (AKS)
- **IaC**: Terraform

### 🔁 CI/CD & DevOps
- **CI/CD**: Azure Pipelines
- **Monitoring**: Prometheus, Grafana
- **Version Control**: Git & GitHub

---

## 🗂️ Project Structure

```text
Project-3/
├─ authentication_app/
│  ├─ backend/
│  ├─ frontend/
│  ├─ kube/
│  ├─ pipeline.yml
│  └─ read.md
├─ project_infra/
│  ├─ Terraform/
│  │  ├─ Azure/
│  │  │  ├─ aks_cluster/
│  │  │  ├─ azurem_subnet/
│  │  │  ├─ azurerm_resource_group/
│  │  │  ├─ azurerm_sql/
│  │  │  ├─ azurerm_virtual_network/
│  │  │  └─ monitoring/
│  │  └─ Windrunner solution/
│  ├─ azure-pipelines.yml
├─ backend.sh
└─ README.md             
```
---

## 🚀 How to Deploy

### 🔧 Step 1: Pre-pipeline Initialization

Before running the Azure DevOps pipeline, you **must run the backend setup script** to initialize the backend build context:

```bash
./backend.sh
```

This prepares the backend structure for the pipeline to run properly.

⚠️ Ensure the backend configuration in the azure-pipelines.yml file exactly matches the backend settings (e.g., storage account name, container name) configured in backend.sh. Any mismatch will result in pipeline failure.


### 🚀 Step 2: Trigger CI/CD Deployment via Azure DevOps

Once `backend.sh` has been executed, push your changes to the `main` branch.

Azure DevOps Pipelines will automatically perform the following:

#### ✅ Infrastructure Pipeline (`project_infra/azure-pipelines.yml`)
- Provisions all infrastructure on Azure using Terraform.

#### ✅ Application Pipeline (`authentication_app/pipeline.yml`)
- Builds and pushes Docker images for frontend and backend.
- Deploys both services to AKS using Kustomize.

---

### 🔐 Azure DevOps Service Connections

Azure DevOps Service Connections must be configured with the correct names as referenced in the pipeline files:

- **AzureConnection** for Azure Resource Manager
- **dockerhub_connection** for DockerHub registry access. 

The DockerHub username and credentials must match what's defined in the pipeline configuration. 

> ⚠️ If these are misconfigured, the pipeline will fail during provisioning or deployment.

---

## ⚙️ CI/CD Pipeline

There are **two Azure DevOps Pipelines** used in this project:

### 1. Infrastructure Pipeline (`project_infra/azure-pipelines.yml`)
- Initializes and applies Terraform to provision:
  - Resource group
  - Virtual network and subnets
  - AKS cluster
  - Azure SQL Database
  - Monitoring tools (Prometheus & Grafana)

### 2. Application Pipeline (`authentication_app/pipeline.yml`)
- **Build & Psuh**: Builds Docker images for frontend and backend and pushes images to DockerHub.
- **Deploy**: Deploys to AKS using `kubectl` and Kustomize.

> Both pipelines are triggered by changes to the `main` branch and are fully automated.

---

## 📡 Monitoring


Monitoring is automatically provisioned during infrastructure deployment using **Terraform**. The stack uses the `kube-prometheus-stack` Helm chart, configured within the `monitoring.tf` file.

### 📦 What's Included

- **Prometheus** for cluster and application metrics collection
- **Grafana** for visualization and dashboards
- Exposed via **LoadBalancer** services for external access

This entire monitoring setup is deployed to the AKS cluster under the `monitoring` namespace without requiring any manual intervention.

> 🔧 You do not need to install Prometheus or Grafana manually, it's fully handled through Infrastructure as Code.


---

## ✅ Features

- ☁️ Fully cloud-native three-tier architecture  
- 🛠 Infrastructure-as-Code (Terraform)  
- ⚙️ Automated CI/CD with Azure Pipelines  
- ☸️ Kubernetes-native deployment (Kustomize)  
- 📊 Monitoring with Prometheus & Grafana  

---

## 📖 Lessons Learned

- Worked collaboratively using Agile practices  
- Gained hands-on experience with Azure services, Kubernetes, and Terraform  
- Understood the importance of GitOps and full CI/CD automation  
- Learned how to design, deploy, and monitor production-grade applications

---

> 👨‍💻 Built with collaboration, containers, and CI/CD pipelines by the DevOps BootCamp 2025 **Windrunners** Team.



