#!/usr/bin/env bash

set -e

docker history khulnasoft/flutter:${FLUTTER_VERSION/+/-}
docker history khulnasoft/flutter:$DOCKER_TAG

if [ "$CIRRUS_BRANCH" != "master" ]
then
    exit 0
fi

docker login --username $DOCKER_USER_NAME --password $DOCKER_PASSWORD

docker push khulnasoft/flutter:${FLUTTER_VERSION/+/-}
docker push khulnasoft/flutter:$DOCKER_TAG
#docker push khulnasoft/flutter:${FLUTTER_VERSION/+/-}-web
#docker push khulnasoft/flutter:$DOCKER_TAG-web

curl -X POST https://hooks.microbadger.com/images/khulnasoft/flutter/jvUQ_07dNfmCwsULt6N9qYdgsNg=
