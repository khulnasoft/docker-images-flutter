#!/usr/bin/env bash

set -e

docker buildx build --platform linux/amd64,linux/arm64 \
             --cache-from khulnasoft/flutter:${FLUTTER_VERSION/+/-} \
             --tag khulnasoft/flutter:${FLUTTER_VERSION/+/-} \
             --tag khulnasoft/flutter:$DOCKER_TAG \
             --build-arg flutter_version=$FLUTTER_VERSION \
             sdk
