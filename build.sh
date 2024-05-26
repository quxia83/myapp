#!/bin/bash

# Fail script on error
set -x
set -e

# Variables
REPO_URL="https://github.com/quxia83/myapp.git"
DOCKER_IMAGE="quxia/myapp"
BUILD_NUMBER=${BUILD_NUMBER:-latest}

# Checkout Code
echo "Checking out code..."
git clone $REPO_URL
cd myapp

# Install Dependencies
echo "Installing dependencies..."
npm install

# Run Tests
echo "Running tests..."
npm test

# Build Docker Image
echo "Building Docker image..."
docker build -t $DOCKER_IMAGE:$BUILD_NUMBER .

# Push Docker Image (Docker Hub connection handled by TeamCity)
echo "Pushing Docker image to Docker Hub..."
docker push $DOCKER_IMAGE:$BUILD_NUMBER

echo "Build and push completed successfully."
