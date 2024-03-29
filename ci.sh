#!/usr/bin/env bash

set -e

if [ "$KHULNASOFT_BRANCH" != "master" ]
then
    docker buildx build --platform linux/amd64,linux/arm64 \
       --tag ghcr.io/khulnasoft/flutter:${FLUTTER_VERSION/+/-} \
       --tag ghcr.io/khulnasoft/flutter:$DOCKER_TAG \
       --build-arg flutter_version=$FLUTTER_VERSION \
       sdk
    exit 0
fi

echo $GITHUB_TOKEN | docker login ghcr.io -u fkorotkov --password-stdin

docker buildx build --platform linux/amd64,linux/arm64 --push \
   --tag ghcr.io/khulnasoft/flutter:${FLUTTER_VERSION/+/-} \
   --tag ghcr.io/khulnasoft/flutter:$DOCKER_TAG \
   --build-arg flutter_version=$FLUTTER_VERSION \
   sdk
