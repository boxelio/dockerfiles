#!/bin/sh

docker buildx build --progress=plain --file=Dockerfile --platform=linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t boxel/wiedehopf-tar1090:latest --push .
