# Overview

This is a simple Go application that exposes a REST endpoint and returns a JSON payload.

## Building

### Docker
This section is for building the application in a docker container on your machine.  
The Github pipelines will build the container when a release is trigger.

#### Prerequisites

* [Docker](https://docs.docker.com/engine/install/) or 
* [Docker Desktop](https://docs.docker.com/get-docker/).
* [Git](https://git-scm.com/downloads)

#### Instructions

1. Once the prerequisites are installed you can clone the repo: `git clone https://github.com/crushten/go_endpoint_cloud`.
2. Change into the `go_endpoint_cloud` directory: `cd go_endpoint_cloud/application`.
3. To build the Docker container run: `docker build -t go_endpoint_cloud:dev .`.

### Locally
This is for building the application locally on your machine.

#### Prerequisites

* [Git](https://git-scm.com/downloads)
* [Go](https://go.dev/doc/install)

#### Instructions

1. Once the prerequisites are installed you can clone the repo: `git clone https://github.com/crushten/go_endpoint_cloud`.
2. Change into the `go_endpoint_cloud` directory: `cd go_endpoint_cloud/application`.
3. Run `go build .`.

There is also a `go_build.sh` script that will output binaries for Linux, Windows, and Mac for amd64 and arm64.
To use the script just run it: `./go_build.sh`.
## Deployment

This application can be deployed as a Golang binary or in a Docker container. The Github pipelines will build binaries for 
MacOS, Linux and Windows. In addition it will build Linux container images for ARM64 and x86_64 architectures.

### Cloud

[Terraform](https://www.terraform.io/) can be used to deploy the application to cloud infrastructure.

The [Terraform EKS Deploy](https://github.com/crushten/terraform_EKS_deploy) is an example of this.

### Locally

Can [build](#building) the project locally to output the binaries and Docker containers. 
Can also run [Goreleaser](https://goreleaser.com/) locally to output all of the artifacts.

## Testing

This section covers testing the application locally. The Github pipelines will test the application when pushed.

### Locally
This is for testing the application locally on your machine.

##### Prerequisites

* [Git](https://git-scm.com/downloads)
* [Go](https://go.dev/doc/install)

##### Instructions
1. Once the prerequisites are installed you can clone the repo: `git clone https://github.com/crushten/go_endpoint_cloud`.
2. Change into the `go_endpoint_cloud` directory: `cd go_endpoint_cloud/application`.
3. Run `GIN_MODE=release  go test -v`.
4. For coverage testing run: `GIN_MODE=release  go test -cover`.