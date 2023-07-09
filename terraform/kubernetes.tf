# provider "kubernetes" {
#   config_path    = "~/.kube/config"
#   config_context = "roy-aicurio-eks-cluster"
# }

# # Deploy the Kubernetes manifest files
# resource "kubernetes_manifest" "apicurio-studio-db" {
#   manifest = file("${path.module}/kubernetes/apicurio-studio-db.yaml")
# }

# # Repeat the above block for other services
