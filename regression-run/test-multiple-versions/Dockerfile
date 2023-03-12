FROM alpine:3.16

WORKDIR /usr/local/src/s3fs
COPY --from=docker /usr/libexec/docker/cli-plugins/docker-compose /usr/bin/docker-compose
COPY ./regression-run/test-multiple-versions/entrypoint.sh /entrypoint.sh
COPY . .

ENTRYPOINT /entrypoint.sh

