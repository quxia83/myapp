#!/bin/bash
set -x
# Variables
REPO_NAME="quxia/myapp"
TAG="latest"

# Build the Docker image using the multi-stage Dockerfile
docker build -t $REPO_NAME:$TAG .

# Docker Login (Ensure this is secure in real use, possibly use secrets management)
# Replace USERNAME and PASSWORD with your Docker Hub credentials
# For CI/CD use, these should be securely provided by the environment or CI/CD system settings
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Push the image to a registry
docker push $REPO_NAME:$TAG
