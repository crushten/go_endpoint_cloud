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

Once the container is built it can be run using: `docker run -p 8080:8080 go_endpoint_cloud`.
This should expose the application in your browser at `http://localhost:8080`.

#### Locally

Once the application has been built it can be run using: `./go_endpoint_cloud`.
This should expose the application in your browser at `http://localhost:8080`.

However, since the application is written in Go it can also just be run using `go run .`.
This should expose the application in your browser at `http://localhost:8080`.

### Testing

This section covers testing the application

### Docker

Todo

### Locally

Todo

### Pipeline

Todo

## Cloud Infrastructure

## Provisioning