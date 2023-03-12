#!/usr/bin/env bash
set -euxo pipefail
NODEJS_VERSIONS_TO_TEST="19.7.0 18.15.0 17.9.1 16.19.1 15.14.0 14.21.3 13.14.0 12.22.12 11.15.0 10.24.1 9.11.2 8.17.0 7.10.1 6.17.1 5.12.0 4.9.1 0.12.18"
COMPOSE_PROJECT_NAME=${1:-s3fs-test}
export COMPOSE_PROJECT_NAME

function cleanup()
{
    exit_status=$?
    echo "exit was $exit_status"
    docker-compose -f regression-run/docker-compose.yml down || true
    exit "$exit_status"
}
trap cleanup EXIT

for NODEJS_VERSION in $NODEJS_VERSIONS_TO_TEST
do
    export NODEJS_VERSION="${NODEJS_VERSION}"
    docker-compose -f regression-run/docker-compose.yml up --build --exit-code-from s3fs-tests
done