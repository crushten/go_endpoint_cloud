resource "aws_ecr_repository" "go-repository" {
  name                 = "go-repo"
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }
}

## Build docker images and push to ECR
resource "docker_registry_image" "go_endpoint_cloud" {
  name = "${aws_ecr_repository.go-repository.repository_url}:latest"

  build {
    context    = "../application"
    dockerfile = "Dockerfile"
  }
}