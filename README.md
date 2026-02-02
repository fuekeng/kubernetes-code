# Project Overview

This repository contains various components for deploying and managing a microservices architecture using **Kubernetes, Helm, and Terraform**. It is structured into multiple directories, each serving a specific purpose in the infrastructure setup.

## Directory Structure

### **helm-chart**
The `helm-chart` directory contains Helm charts for deploying various applications. Each subdirectory represents a different application or service.

- `example/` - Sample Helm chart for testing.
- `nginx/` - Helm chart for deploying **NGINX**.
- `springboot/` - Helm chart for deploying our microservices.

### **microservices**
The `microservices` directory contains the source code for different microservices. Each subdirectory represents a different microservice.

- **[HelloService](microservices/HelloService/)** - A Spring Boot application that provides a "Hello" service.
- **[WorldService](microservices/WorldService/)** - A Spring Boot application that provides a "World" service.
- **[HelloWorldClient](microservices/HelloWorldClient/)** - A client application that interacts with the Hello and World services.

### **nginx**
The `nginx` directory contains configurations for deploying **NGINX** as a reverse proxy and load balancer in Kubernetes.

- `fargate/` - Deployment configurations for running workloads on an **AWS Fargate** profile.
- `eks_auto/` - Deployment configurations for workloads on **EKS Auto Mode**.
- **All other YAML files** are used to deploy workloads on an **EKS Managed Node Group**.

### **storage**
The `storage` directory contains configurations for managing **persistent storage** in Kubernetes, including **Persistent Volume Claims (PVCs)** and **Storage Classes**.

### **terraform**
The `terraform` directory contains Terraform scripts for provisioning infrastructure on AWS, including **EKS clusters and associated resources**.

- `automode/` - Complete Terraform code to create an **EKS cluster using Auto Mode**.
- `eks_nodegroup/` - Complete Terraform code to create an **EKS cluster using Managed Node Groups**.

## 🎥 YouTube Playlists
📌 Expand your knowledge with these step-by-step **YouTube tutorials**:

- **[Free EKS Beginner's Guide](https://www.youtube.com/playlist?list=PLV1HZYG6utmUvEoLMNnkVSX9XY0aFDPZw)** – Learn how to deploy Kubernetes workloads on AWS EKS from scratch!
- **[Free EKS Auto Mode Tutorial for Beginners](https://www.youtube.com/playlist?list=PLV1HZYG6utmVIN-bLwp80ZLoy3Z9nRmHB)** – A deep dive into **EKS Auto Mode** for cost-effective Kubernetes deployment.

---

🚀 **Start your Kubernetes journey today and deploy scalable applications effortlessly!**