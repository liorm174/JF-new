# Docker and JFrog Artifactory Setup

This guide explains how to build and push your Docker image to JFrog Artifactory.

## Prerequisites

1. Docker Desktop running (you should have this set up already)
2. JFrog Artifactory instance URL
3. JFrog credentials (username and password/API key)
4. Docker repository created in JFrog Artifactory

## Quick Start

### Option 1: Using the Script (Recommended)

1. **Set environment variables** (or edit the script):
   ```bash
   export JFROG_URL="your-jfrog-instance.jfrog.io"
   export JFROG_REPO="docker-local"  # or your repository name
   export IMAGE_NAME="jf-app"
   ```

2. **Make the script executable**:
   ```bash
   chmod +x push-to-jfrog.sh
   ```

3. **Run the script**:
   ```bash
   ./push-to-jfrog.sh [version]
   ```
   
   Example:
   ```bash
   ./push-to-jfrog.sh 1.0.0
   ```

### Option 2: Manual Steps

1. **Build the Docker image**:
   ```bash
   docker build -t jf-app:latest .
   ```

2. **Tag the image for JFrog**:
   ```bash
   docker tag jf-app:latest your-jfrog-instance.jfrog.io/docker-local/jf-app:latest
   ```

3. **Login to JFrog**:
   ```bash
   docker login your-jfrog-instance.jfrog.io
   ```
   Enter your JFrog username and password/API key when prompted.

4. **Push the image**:
   ```bash
   docker push your-jfrog-instance.jfrog.io/docker-local/jf-app:latest
   ```

## JFrog Repository Types

- **docker-local**: Local repository for your own images
- **docker-remote**: Remote repository (proxy to Docker Hub, etc.)
- **docker-virtual**: Virtual repository (combines local and remote)

## Using Environment Variables

You can also set these as environment variables:

```bash
export JFROG_URL="your-jfrog-instance.jfrog.io"
export JFROG_REPO="docker-local"
export IMAGE_NAME="jf-app"
```

Then run the script without editing it.

## Pulling the Image

To pull the image from JFrog later:

```bash
docker login your-jfrog-instance.jfrog.io
docker pull your-jfrog-instance.jfrog.io/docker-local/jf-app:latest
```

## Troubleshooting

- **Authentication errors**: Make sure your JFrog credentials are correct
- **Repository not found**: Verify the repository name exists in your JFrog instance
- **Permission denied**: Check that your user has push permissions to the repository


