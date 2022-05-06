#!/usr/bin/env bash
set -euxo pipefail

COMPOSE_PROJECT_NAME=${1:-s3fs-test}
export COMPOSE_PROJECT_NAME

function cleanup()
{
    exit_status=$?
    echo "exit was $exit_status"
    docker-compose down || true
    exit "$exit_status"
}
trap cleanup EXIT
docker-compose up --pull --build --exit-code-from s3fs-tests
