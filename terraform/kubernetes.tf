resource "kubernetes_namespace" "godemo" {
  metadata {
    name = "godemo"
  }

}

resource "kubernetes_deployment" "go" {
  metadata {
    name      = "go-deployment"
    namespace = kubernetes_namespace.godemo.metadata.0.name
    labels = {
      app = "go_endpoint_cloud"
    } //labels
  }   //metadata

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "go_endpoint_cloud"
      } //selector
    }   //spec

    template {
      metadata {
        labels = {
          app = "go_endpoint_cloud"
        } //labels
      }   //metadata

      spec {
        container {
          image = "${aws_ecr_repository.demo-repository.repository_url}:latest"
          name  = "go-endpoint-cloud-container"
          port {
            container_port = 8080
          } //port
          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            } //limits
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            } //requests
          }   //container resources 
          liveness_probe {
            http_get {
              path = "/healthcheck"
              port = 8080
            } //http get
            initial_delay_seconds = 5
            period_seconds        = 15
          } //liveness probe
        }   //container
      }     //spec
    }       //template
  }         //s[ec]
}           //resource deployment

resource "kubernetes_service" "go" {
  depends_on = [kubernetes_deployment.go]
  metadata {
    name      = "go-endpoint-cloud-service" //doesnt seem to like underscores for some reason
    namespace = kubernetes_namespace.godemo.metadata.0.name
  } //metadata
  spec {
    selector = {
      app = kubernetes_deployment.go.spec.0.template.0.metadata[0].labels.app
    }
    port {
      port        = 8080
      target_port = 8080
    }
    type = "LoadBalancer"
  } //spec
}   //resource service