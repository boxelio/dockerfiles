#!/bin/sh

#docker buildx build --progress=plain --no-cache --file=Dockerfile --platform=linux/arm64,linux/arm/v7 -t boxel/readsb:latest --push .
#docker buildx build --progress=plain --file=Dockerfile --platform=linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t boxel/wiedehopf-graphs1090:latest --push .
docker buildx build --progress=plain --file=Dockerfile --platform=linux/arm/v6 -t boxel/wiedehopf-graphs1090:latest --push .
