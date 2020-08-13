#!/bin/sh

docker buildx build --progress=plain --file=Dockerfile --platform=linux/arm/v6,linux/arm/v7,linux/arm64,linux/amd64 -t boxel/wiedehopf-graphs1090:latest --push .
