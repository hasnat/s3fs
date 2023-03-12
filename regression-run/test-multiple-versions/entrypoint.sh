#!/usr/bin/env sh
set -euxo pipefail

function cleanup()
{
    exit_status=$?
    echo "exit was $exit_status"
    docker-compose -f regression-run/docker-compose.yml down 2>&1|| true
    exit $exit_status
}
trap cleanup EXIT

docker-compose -f regression-run/docker-compose.yml up -d --no-recreate s3fs-fake-s3

for NODEJS_VERSION in $NODEJS_VERSIONS_TO_TEST_UNIT
do
    export NODEJS_VERSION="${NODEJS_VERSION}"
    docker-compose -f regression-run/docker-compose.yml build s3fs-tests
    echo "======================Start unit testing nodejs version ${NODEJS_VERSION}============================="
    NODE_ENV=production \
    TEST_COMMAND="npm run test" \
    docker-compose -f regression-run/docker-compose.yml up s3fs-tests --no-recreate --exit-code-from s3fs-tests
done


for NODEJS_VERSION in $NODEJS_VERSIONS_TO_TEST_REGRESSION
do
    export NODEJS_VERSION="${NODEJS_VERSION}"
    docker-compose -f regression-run/docker-compose.yml build s3fs-tests
    echo "======================Start regression testing nodejs version ${NODEJS_VERSION}============================="
    NODE_ENV=production \
    TEST_COMMAND="npm run test-regression" \
    docker-compose -f regression-run/docker-compose.yml up s3fs-tests --no-recreate --exit-code-from s3fs-tests
done