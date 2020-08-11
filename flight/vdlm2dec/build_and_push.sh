#!/bin/sh

docker buildx build --progress=plain --file=Dockerfile --platform=linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 -t boxel/vdlm2dec:latest --push .
