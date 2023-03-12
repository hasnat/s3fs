# S3FS Tests

Docker Compose is used to build and deploy a test environment.

test.sh waits on tests exit code.
## Run tests
```
docker-compose -f regression-run/docker-compose.yml up -d fake-s3
docker-compose -f regression-run/docker-compose.yml up s3fs-tests
```

## Run multiple versions test
```
./regression-run/test-multiple-versions.sh
```
