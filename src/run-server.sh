#!/bin/bash

echo "Starting server at host [$SERVER_HOST]"
while true; do
  ssb-server start --host "${SERVER_HOST}"
done
