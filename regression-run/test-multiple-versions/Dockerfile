FROM alpine:3.16

WORKDIR /usr/local/an-app
COPY . .
COPY --from=docker /usr/libexec/docker/cli-plugins/docker-compose /usr/bin/docker-compose
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

