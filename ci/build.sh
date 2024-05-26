#!/bin/bash
set -x 
# Fail script on error
set -e

# Variables
DOCKER_IMAGE="quxia/myapp"
BUILD_NUMBER=${BUILD_NUMBER:-latest}

# Build Docker Image
echo "Building Docker image..."
docker build -t $DOCKER_IMAGE:$BUILD_NUMBER .

# Push Docker Image
echo "Pushing Docker image to Docker Hub..."
docker push $DOCKER_IMAGE:$BUILD_NUMBER

echo "Build and push completed successfully."
