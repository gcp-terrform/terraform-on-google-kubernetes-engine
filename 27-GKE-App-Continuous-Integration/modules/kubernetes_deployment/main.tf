# Resource: Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "myapp1" {
  metadata {
    name = var.deployment_name
    namespace = var.namespace
    labels = {
      app = var.app_name_label
    }
  } 
  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = var.app_name_label
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_name_label
        }
      }
      spec {
        container {
          #image = "asia-south1-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/myapps-repository/myapp1:COMMIT_SHA"
          image = "asia-south1-docker.pkg.dev/petromin-gms/myapps-repository/myapp1:6dfda37"
          name  = "myapp1-container"
          port {
            container_port = 80
          }
          }
        }
      }
    }
}

