#!/usr/bin/env sh
set -euxo pipefail

function cleanup()
{
    exit_status=$?
    echo "exit was $exit_status"

    docker-compose -f regression-run/docker-compose.yml rm s3fs-fake-s3 -f  || true

    exit "$exit_status"
}
trap cleanup EXIT

docker-compose -f regression-run/docker-compose.yml up --build -d --no-recreate s3fs-fake-s3

for NODEJS_VERSION in $NODEJS_VERSIONS_TO_TEST_UNIT
do
    echo "======================Start unit testing nodejs version ${NODEJS_VERSION}============================="
    NODEJS_VERSION="${NODEJS_VERSION}" \
    NODE_ENV=development \
    TEST_COMMAND="npm run test" \
    docker-compose -f regression-run/docker-compose.yml up --build s3fs-tests --exit-code-from s3fs-tests
done


for NODEJS_VERSION in $NODEJS_VERSIONS_TO_TEST_REGRESSION
do
    echo "======================Start regression testing nodejs version ${NODEJS_VERSION}============================="
    NODEJS_VERSION="${NODEJS_VERSION}" \
    NODE_ENV=production \
    TEST_COMMAND="npm run test-regression" \
    docker-compose -f regression-run/docker-compose.yml up --build s3fs-tests --exit-code-from s3fs-tests
done