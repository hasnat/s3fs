# S3FS Tests

Docker Compose is used to build and deploy a test environment.

test.sh waits on tests exit code.
## Run tests
```
docker-compose up -d fake-s3
docker-compose up s3fs-tests
```

## Run tests
```
cd tests
./tests.sh
```
