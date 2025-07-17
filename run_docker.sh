#!/bin/bash

# Variables
IMAGE_NAME="optical-stereo-dsm"
SCRIPT_NAME=$1        # e.g. run_spot_pipeline.py
CONFIG_FILE=$2        # e.g. config_spot.json

# Usage help
if [ -z "$SCRIPT_NAME" ] || [ -z "$CONFIG_FILE" ]; then
  echo "Usage: ./run_docker.sh <script_name.py> <config_file.json>"
  echo "Example: ./run_docker.sh run_spot_pipeline.py config_spot.json"
  exit 1
fi

# Build Docker image
echo "🔨 Building Docker image..."
docker build -t $IMAGE_NAME .

# Run Docker container
echo "🚀 Running Docker container..."
docker run --rm \
  -v "$(pwd)":/app \
  $IMAGE_NAME \
  $SCRIPT_NAME \
  $CONFIG_FILE
