# hadolint ignore=DL3006
FROM gcr.io/distroless/static-debian11

COPY go_endpoint_cloud /app

CMD [ "/app" ]