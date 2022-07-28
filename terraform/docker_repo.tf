resource "aws_ecr_repository" "demo-repository" {
  name                 = "demo-repo"
  image_tag_mutability = "IMMUTABLE"

    image_scanning_configuration {
      scan_on_push = true
    }
}

provider "docker" {
    host = "unix:///var/run/docker.sock"
}

resource "docker_image" "go_endpoint_cloud" {
    name = "go_endpoint_cloud"
    build {
      path = "../Dockerfile"
      tag  = ["go_endpoint_cloud:demo"] 
    }
}

resource "docker_container" "go_endpoint_cloud" {
    name = "go_endpoint_cloud"
    image = docker_image.go_endpoint_cloud.latest
}