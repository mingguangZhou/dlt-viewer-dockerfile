#!/bin/bash

# Check if the script is run with sudo or by root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

# Load fuse module
echo "Loading fuse module..."
modprobe fuse

# Allow local connections to the X server
echo "Enabling local connections to the X server..."
xhost +local:docker

# Define Docker image name and version
DOCKER_IMAGE="dltviewer:2.25"

# Run the Docker container with appropriate options
echo "Starting dlt-viewer inside Docker..."
docker run --rm -it --privileged \
  -e DISPLAY="$DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  "$DOCKER_IMAGE"

