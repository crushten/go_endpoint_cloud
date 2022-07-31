# Overview

This is a simple Go application that exposes a REST endpoint and returns a JSON payload.

The goal of this was build an application that exposes a REST endpoint and return's a JSON payload. 
Another goal was to deploy the application to a cloud provider's managed Kubernetes cluster.
The deployment must be done completely through code.

The chosen cloud provider is AWS and it's EKS managed Kubernetes service.

## Application

This section covers the application specificity.

### Building

#### Docker
This section is for building the application in a docker container on your machine.

##### Prerequisites

* [Docker](https://docs.docker.com/engine/install/) or 
* [Docker Desktop](https://docs.docker.com/get-docker/).
* [Git](https://git-scm.com/downloads)

##### Instructions

1. Once the prerequisites are installed you can clone the repo: `git clone https://github.com/crushten/go_endpoint_cloud`.
2. Change into the `go_endpoint_cloud` directory: `cd go_endpoint_cloud`.
3. To build the Docker container run: `docker build -t go_endpoint_cloud:dev .`.

#### Locally
This is for building the application locally on your machine.

##### Prerequisites

* [Git](https://git-scm.com/downloads)
* [Go](https://go.dev/doc/install)

##### Instructions

1. Once the prerequisites are installed you can clone the repo: `git clone https://github.com/crushten/go_endpoint_cloud`.
2. Change into the `go_endpoint_cloud` directory: `cd go_endpoint_cloud`.
3. Run `go build .`.

#### Pipeline

Todo 

### Deployment

This section covers deploying the application.

#### Cloud

See the below section under Infrastructure.

#### Docker

Once the container is built it can be run on the local machine.
See the [Running](#running) section for instructions.

#### Locally

Once the application is built it can be run. Although it can also be run without building.
See the [Running](#running) section for instructions.

### Running

This section covers running the application.

#### Docker

##### Prerequisites

* [curl](https://curl.se/download.html)


##### Instructions

1. Once the container is built it can be run using: `docker run -p 8080:8080 go_endpoint_cloud`.
   This should expose the application in your browser at `http://localhost:8080`.
2. Can use `curl` or similar tool to test the endpoints: `curl http://localhost:8080/messages` 
   and `curl http://localhost:8080/healthcheck`.


#### Locally

##### Prerequisites

* [curl](https://curl.se/download.html)

##### Instructions

1. Once the application has been built it can be run using: `./go_endpoint_cloud`.
   This should expose the application in your browser at `http://localhost:8080`.
2. Can use `curl` or similar tool to test the endpoints: `curl http://localhost:8080/messages` 
   and `curl http://localhost:8080/healthcheck`.

or

1. Since the application is written in Go it can also just be run using `go run .`.
   This should expose the application in your browser at `http://localhost:8080`.
2. Can use `curl` or similar tool to test the endpoints: `curl http://localhost:8080/messages` 
   and `curl http://localhost:8080/healthcheck`.

### Testing

This section covers testing the application

### Locally
This is for testing the application locally on your machine.

##### Prerequisites

* [Git](https://git-scm.com/downloads)
* [Go](https://go.dev/doc/install)

##### Instructions
1. Once the prerequisites are installed you can clone the repo: `git clone https://github.com/crushten/go_endpoint_cloud`.
2. Change into the `go_endpoint_cloud` directory: `cd go_endpoint_cloud`.
3. Run `GIN_MODE=release  go test -v`.
4. For coverage testing run: `GIN_MODE=release  go test -cover`.

### Pipeline

Todo

## Cloud Infrastructure

This covers provisioning the cloud infrastructure and deploying the application to it.

### Provisioning
This section covers provisioning the cluster.

##### Prerequisites
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Git](https://git-scm.com/downloads)
* [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

##### Instructions
1. Once the prerequisites are installed you can clone the repo: `git clone https://github.com/crushten/go_endpoint_cloud`.
2. Make sure the AWS CLI is [setup](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) and able to connect to your account.
3. Change into the `terraform` directory: `cd go_endpoint_cloud/terraform`.
4. Initialize Terraform to download needed modules and provisioners: `terraform init`.
5. Check for what Terraform will do: `terraform plan`.
6. If everything looks good then provision everything: `terraform apply`.
7. You will need to type `yes` when prompted.

### Deploy Application
This section covers deploying the application.

##### Prerequisites
* [Git](https://git-scm.com/downloads)
* [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* [Docker](https://docs.docker.com/engine/install/) or 
* [Docker Desktop](https://docs.docker.com/get-docker/).

##### Instructions
This doesn't current work. It is also tied to the provisioning process.

### Deprovisioning 
This section covers destroying the cluster and application.

##### Instructions
To delete/remove the provisioned infrastructure run `terraform destroy`.

### Testing
This section covers testing the Terraform code and verifying that application is running.

#### Terraform

To test the Terraform files themselves can run `terraform validate`.
Also running `terraform plan` can find issues that `validate` wont.

#### Infrastructure

Todo

## Know Issues

1. The application deployment currently doesn't work. Need to figure out how to push the container to ECR.

## Todo

1. Need to verify the application is up/running.
2. Add pipelines to lint/test/build the application and lint/test terraform files.
3. Improve local dev experience.
4. Metrics and log collection should also be setup.
5. Clean up Go code and Terraform files.
