provider "aws" {
  region = "us-east-1"
  
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    token                  = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  }
}



terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
          version = "2.17.0" 
    }
    kubectl = {
      source = "bnu0/kubectl"
      version = "0.27.0"
    }
  }

  backend "s3" {
    region = "us-east-1"
    bucket = "devops4solutions-terraform"
    key    = "eks/worldservice.tfstate"
  }
}