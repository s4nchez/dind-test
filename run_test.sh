#!/usr/bin/env bash


BASE_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

docker version

docker run -p 8000:80 -d --name httpbin kennethreitz/httpbin

sleep 2

curl -v http://127.0.0.1:8000/json

docker stop httpbin
docker rm httpbin