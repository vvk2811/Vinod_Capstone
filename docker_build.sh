#!/bin/bash

# Configuration
IMAGE_NAME="vinod"
IMAGE_TAG="latest"

# Path to Dockerfile
DOCKERFILE_PATH="."

# Build Docker image
echo "Building Docker image..."
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKERFILE_PATH}

# Check if the build was successful
if [ $? -eq 0 ]; then
	  echo "Docker image '${IMAGE_NAME}:${IMAGE_TAG}' built successfully!"
  else
	    echo "Error: Docker image build failed."
	      exit 1
fi

