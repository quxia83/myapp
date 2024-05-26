#!/bin/bash
set -x

# Variables
BUILD_DATE=$(date +%Y%m%d)
BUILD_NUMBER=$BUILD_NUMBER

REPO_NAME="quxia/myapp"

# Tags
TAG_DATE_BUILD="$REPO_NAME:$BUILD_NUMBER-$BUILD_DATE"
TAG_LATEST="$REPO_NAME:latest"

# Build the Docker image
docker build -t $TAG_DATE_BUILD -t $TAG_LATEST .

# Docker Login (Ensure this is secure in real use, possibly use secrets management)
# Replace USERNAME and PASSWORD with your Docker Hub credentials
# For CI/CD use, these should be securely provided by the environment or CI/CD system settings
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Push the tagged image with the date and build number
docker push $TAG_DATE_BUILD

# Push the 'latest' tag
docker push $TAG_LATEST
