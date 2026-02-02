## Requirements for EKS Cluster
This Terraform setup creates the following resources:  

### 1. VPC  
- A Virtual Private Cloud (VPC) with both **private** and **public** subnets  
- Required for networking and EKS cluster communication  

### 2. EKS Auto Mode Cluster  
- A fully managed **EKS Auto Mode** cluster  
- Automatically provisions compute capacity and manages scaling  

### 3. IAM Roles & Groups  
- IAM **Roles** and **Groups** to control access to the EKS cluster  
- Ensures secure access and authentication  

### 4. IngressClassParams  
