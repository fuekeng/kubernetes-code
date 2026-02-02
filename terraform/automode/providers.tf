provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "devops4solutions-terraform"
    key    = "eks_cluster_automode.tfstate"
  }
  required_providers {
    kubectl = {
      source = "bnu0/kubectl"
      version = "0.27.0"
    }
  }
}

provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  load_config_file       = false
  token  =data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}
