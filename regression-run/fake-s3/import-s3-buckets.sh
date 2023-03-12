#!/usr/bin/env bash
set -exuo pipefail
cd /local-s3-data

for BUCKET in `find . -maxdepth 1 -type d | sed 's#\.\/##'`
do
  if [[ "$BUCKET" != "." ]]
  then
    (awslocal s3 mb s3://${BUCKET} || true)
    awslocal s3 sync ./${BUCKET}/ s3://${BUCKET} --exclude "*.DS_Store*"
  fi
done