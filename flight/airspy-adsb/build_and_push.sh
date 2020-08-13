#!/bin/sh

docker buildx build --progress=plain --file=Dockerfile --platform=linux/arm/v6,linux/arm/v7 -t boxel/airspy-adsb:latest --push .
