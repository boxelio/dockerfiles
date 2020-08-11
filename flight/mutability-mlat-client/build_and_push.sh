#!/bin/sh

docker buildx build --progress=plain --no-cache --file=Dockerfile --platform=linux/amd64,linux/arm64,linux/arm/v7 -t boxel/mutability-mlat-client:latest --push .
