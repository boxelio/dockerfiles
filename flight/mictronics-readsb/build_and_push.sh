#!/bin/sh

#docker buildx build --progress=plain --no-cache --file=Dockerfile --platform=linux/arm64,linux/arm/v7 -t boxel/readsb:latest --push .
docker buildx build --progress=plain --file=Dockerfile --platform=linux/arm64,linux/arm/v7 -t boxel/mictronics-readsb:latest --push .
