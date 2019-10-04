#!/bin/sh

cd $1
# docker buildx build --file=$2 --platform=linux/amd64,linux/arm64,linux/arm/v7 -t $3 --push .
# docker buildx build --progress=plain --no-cache --file=Dockerfile --platform=linux/amd64,linux/arm64,linux/arm/v7 -t boxel/$1:latest --push .
docker buildx build --progress=plain --no-cache --file=Dockerfile --platform=linux/amd64,linux/arm/v7 -t boxel/$1:latest --push .
# docker buildx build --progress=plain --no-cache --file=Dockerfile --platform=linux/amd64,linux/arm/v7 -t boxel/$1:latest --push .
# docker buildx build --progress=plain --file=$2 --platform=linux/amd64,linux/arm64,linux/arm/v7 -t $3 --push .
# docker buildx build --file=$2 --platform=linux/amd64,linux/arm64,linux/arm/v7 -t $3 --push .
# docker buildx build --progress=plain --no-cache --file=$2 -t $3 --push .
