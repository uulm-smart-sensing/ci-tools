#!/bin/sh

# Build specified container and push with tags

# first passed argument will be used as the target stage/image name
# all further passed arguments will be sent to the docker build command
IMAGE_NAME="$CI_REGISTRY/se-anwendungsprojekt-22-23/ci-tools/$1"

# build the commit tag image
docker build --pull --tag $IMAGE_NAME:$CI_COMMIT_SHA $1

# push new image tags
docker push $IMAGE_NAME:$CI_COMMIT_SHA
