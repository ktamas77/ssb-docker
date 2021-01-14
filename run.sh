#!/bin/sh

echo "Server: [$1]"
docker run --env SERVER_HOST="$1" ktamas77/ssb-docker
