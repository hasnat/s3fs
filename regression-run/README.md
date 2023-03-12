# S3FS Tests

Docker Compose is used to build and deploy a test environment.

test.sh waits on tests exit code.
## Run tests
```
docker-compose -f regression-run/docker-compose.yml up -d fake-s3
docker-compose -f regression-run/docker-compose.yml up --build s3fs-tests --exit-code-from s3fs-tests
docker-compose -f regression-run/docker-compose.yml up --build s3fs-test-multiple-versions --exit-code-from s3fs-test-multiple-versions
```

## Run multiple versions test
```
./regression-run/test-multiple-versions.sh
```
