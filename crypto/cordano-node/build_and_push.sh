#!/bin/sh

ORG="boxel"
NAME="cordano-node"
# PLATFORMS="linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7"
PLATFORMS="linux/amd64"
VERSION="1.19.0"
TAG="${ORG}/${NAME}:${VERSION}"

docker buildx build \
  --progress=plain --file=Dockerfile \
  --platform=${PLATFORMS} \
  -t ${TAG} --push .
