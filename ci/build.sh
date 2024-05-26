#!/bin/bash

set -x
# Variables
REPO_NAME="quxia/myapp"
BUILDER_TAG="builder"
APP_TAG="latest"

# Build the builder image
docker build -t $REPO_NAME:$BUILDER_TAG -f ci/Dockerfile.builder .

# Build the application image
docker build -t $REPO_NAME:$APP_TAG -f ci/Dockerfile.app .

# Docker Login (ensure this is secure in real use, possibly use secrets management)
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Push the images to a registry
docker push $REPO_NAME:$BUILDER_TAG
docker push $REPO_NAME:$APP_TAG
