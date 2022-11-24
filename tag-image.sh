#!/bin/sh

# Tag and push specified image with current CI tag

NAME="$1"
IMAGE_NAME="$CI_REGISTRY/se-anwendungsprojekt-22-23/ci-tools/$NAME"

docker pull $IMAGE_NAME:$CI_COMMIT_SHA

docker tag $IMAGE_NAME:$CI_COMMIT_SHA $IMAGE_NAME:$CI_COMMIT_TAG
docker push $IMAGE_NAME:$CI_COMMIT_TAG
