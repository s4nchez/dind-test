#!/usr/bin/env bash


BASE_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

docker version

docker run -p 8000:80 -d --name httpbin kennethreitz/httpbin

sleep 2

curl -v http://localhost:8000/json

EXIT_CODE=$?

docker stop httpbin
docker rm httpbin

exit $EXIT_CODE