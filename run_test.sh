#!/usr/bin/env bash

set -e
set -o errexit
set -o pipefail
set -o nounset

BASE_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

docker run -p 8000:80 -d --name httpbin kennethreitz/httpbin

sleep 2

curl -v http://host.docker.internal:8000/json

docker stop httpbin
docker rm httpbin