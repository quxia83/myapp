#!/bin/bash
set -x
# Variables
REPO_NAME="quxia/myapp"
TAG="latest"

# Build the Docker image using the multi-stage Dockerfile
docker build -t $REPO_NAME:$TAG .


# Push the image to a registry
docker push $REPO_NAME:$TAG
