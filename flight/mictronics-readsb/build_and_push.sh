#!/bin/sh

docker buildx build --progress=plain --file=Dockerfile --platform=linux/arm/v6,linux/arm/v7,linux/arm64 -t boxel/mictronics-readsb:latest --push .
