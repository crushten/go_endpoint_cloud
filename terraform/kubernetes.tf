resource "kubernetes_deployment" "go" {
  metadata {
    name = "microservice-deployment"
    labels = {
      app  = "go_endpoint_cloud"
    }
  }
spec {
    replicas = 1
selector {
      match_labels = {
        app  = "go_endpoint_cloud"
      }
    }
template {
      metadata {
        labels = {
          app  = "go_endpoint_cloud"
        }
      }
spec {
        container {
          image = ".amazonaws.com/go_endpoint_cloud:demo"
          name  = "go_endpoint_cloud-container"
          port {
            container_port = 8080
         }
        }
      }
    }
  }
}
resource "kubernetes_service" "go" {
  depends_on = [kubernetes_deployment.go]
  metadata {
    name = "go-endpoint-cloud-service" //doesnt seem to like underscores for some reason
  }
  spec {
    selector = {
      app = "go_endpoint_cloud"
    }
    port {
      port        = 8080
      target_port = 8080
    }
type = "LoadBalancer"
}
}