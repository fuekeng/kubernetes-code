# EKS automode
aws eks --region us-east-1 update-kubeconfig --name eks-automode
helm install hello springboot -f springboot/eks_auto/values_hello_auto.yaml 
helm install world springboot -f springboot/eks_auto/values_world_auto.yaml
helm install client springboot -f springboot/eks_auto/values_client_auto.yaml

# EKS Managed Node group
aws eks --region us-east-1 update-kubeconfig --name eks-1
helm install client springboot -f springboot/eks_nodegroup/values_client.yaml
helm install world springboot -f springboot/eks_nodegroup/values_world.yaml
helm install hello springboot -f springboot/eks_nodegroup/values_hello.yaml