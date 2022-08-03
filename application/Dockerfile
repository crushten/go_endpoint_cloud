# syntax=docker/dockerfile:1
FROM golang:1.18.4 AS build

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends build-essential gcc && rm -rf /var/lib/apt/lists/*

WORKDIR /go/src/app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 go build -o /go/bin/app

# hadolint ignore=DL3006
FROM gcr.io/distroless/static-debian11

COPY --from=build /go/bin/app /

CMD [ "/app" ]