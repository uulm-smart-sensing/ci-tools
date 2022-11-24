#!/bin/sh

# Build specified container and push with tags

# first passed argument will be used as the target stage/image name
# all further passed arguments will be sent to the docker build command
IMAGE_NAME="$CI_REGISTRY/se-anwendungsprojekt-22-23/ci-tools/$1"

# build the commit tag image
docker build --pull --tag $IMAGE_NAME:$CI_COMMIT_SHA --target $@ $1

# builds in MRs get branch name as tag
if [ -n "$CI_MERGE_REQUEST_SOURCE_BRANCH_NAME" ]; then
  docker tag $IMAGE_NAME:$CI_COMMIT_SHA $IMAGE_NAME:$CI_MERGE_REQUEST_SOURCE_BRANCH_NAME
  docker push $IMAGE_NAME:$CI_MERGE_REQUEST_SOURCE_BRANCH_NAME
fi

# push new image tags
docker push $IMAGE_NAME:$CI_COMMIT_SHA
