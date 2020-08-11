#!/bin/sh

docker buildx build --progress=plain --file=Dockerfile --platform=linux/amd64,linux/arm64 -t boxel/acars-aggregation-server:latest --push .
