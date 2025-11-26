#!/bin/bash

# Script to build and push Docker image to JFrog Artifactory
# Usage: ./push-to-jfrog.sh [version]

set -e

# Configuration - Update these with your JFrog details
JFROG_URL="${JFROG_URL:-your-jfrog-instance.jfrog.io}"
JFROG_REPO="${JFROG_REPO:-docker-local}"  # or docker-remote, docker-virtual
IMAGE_NAME="${IMAGE_NAME:-jf-app}"
VERSION="${1:-latest}"

# Full image path
FULL_IMAGE_NAME="${JFROG_URL}/${JFROG_REPO}/${IMAGE_NAME}:${VERSION}"

echo "Building Docker image..."
docker build -t ${IMAGE_NAME}:${VERSION} .

echo "Tagging image for JFrog..."
docker tag ${IMAGE_NAME}:${VERSION} ${FULL_IMAGE_NAME}

echo "Logging into JFrog Artifactory..."
echo "Please enter your JFrog credentials when prompted:"
docker login ${JFROG_URL}

echo "Pushing image to JFrog..."
docker push ${FULL_IMAGE_NAME}

echo "Successfully pushed ${FULL_IMAGE_NAME}"
echo ""
echo "To pull this image later, use:"
echo "  docker pull ${FULL_IMAGE_NAME}"


