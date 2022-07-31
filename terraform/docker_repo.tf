resource "aws_ecr_repository" "demo-repository" {
  name                 = "demo-repo"
  image_tag_mutability = "IMMUTABLE"

    image_scanning_configuration {
      scan_on_push = true
    }
}

provider "docker" {
  registry_auth {
    address  = local.aws_ecr_url
    username = data.aws_ecr_authorization_token.token.user_name
    password = data.aws_ecr_authorization_token.token.password
  }
}

## Build docker images and push to ECR
resource "docker_registry_image" "go_endpoint_cloud" {
    name = "${aws_ecr_repository.demo-repository.repository_url}:latest"

    build {
        context = ".."
        dockerfile = "Dockerfile"
    }  
}