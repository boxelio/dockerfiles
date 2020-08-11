#!/bin/sh

docker buildx build --progress=plain --no-cache --file=Dockerfile --platform=linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 -t boxel/acarsdec:latest --push .
