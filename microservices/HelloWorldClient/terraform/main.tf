resource "helm_release" "myapp" {
  name       = "client-svc"
  repository = "https://devops4solutions.github.io/springboot-helm-chart/" # Using the published Helm repo
  chart      = "springboot"
  namespace  = "app1"  # Change as per your setup
  version    = "0.1.5"    # Use the correct version from index.yaml
  create_namespace = "true"
  values = [
    file("${path.module}/values_client.yaml")  # Optional: Use custom values file
  ]
}