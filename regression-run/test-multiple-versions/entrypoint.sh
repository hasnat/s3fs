#!/usr/bin/env sh
set -euxo pipefail

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
    echo "======================Start testing nodejs version ${NODEJS_VERSION}============================="
    echo ""
    docker-compose -f regression-run/docker-compose.yml up --build s3fs-tests --exit-code-from s3fs-tests
    echo ""
    echo "======================Done testing nodejs version ${NODEJS_VERSION}=============================="
done