#!/bin/bash
set -x
# Fail script on error
set -e

# Variables
DOCKER_IMAGE="quxia/myapp"
BUILD_NUMBER=${BUILD_NUMBER:-latest}
WORK_DIR="/usr/src/app"
DOCKER_BUILDER_IMAGE="quxia/myapp-builder"

# Run the build process inside the Docker builder container
echo "Running the build process inside the Docker builder container..."
docker run --rm -v "$(pwd)":$WORK_DIR $DOCKER_BUILDER_IMAGE /bin/bash -c "
  cd $WORK_DIR &&
  npm install &&
  npm test &&
  docker build -t $DOCKER_IMAGE:$BUILD_NUMBER .
"

# Push Docker Image
echo "Pushing Docker image to Docker Hub..."
docker push $DOCKER_IMAGE:$BUILD_NUMBER

echo "Build and push completed successfully."
