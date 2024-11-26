#!/usr/bin/env bash


BASE_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

ip addr show docker0

docker run -p 8000:80 -d --name httpbin kennethreitz/httpbin

sleep 2

curl -v http://localhost:8000/json

docker stop httpbin
docker rm httpbin