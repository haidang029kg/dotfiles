#!/bin/bash

# LocalStack startup script with persistent volume
# Usage: ./start_localstack.sh

set -e

# Configuration
LOCALSTACK_DATA_DIR="${HOME}/.localstack/data"
LOCALSTACK_VOLUME_DIR="${HOME}/.localstack/volume"

# Create persistent directories if they don't exist
mkdir -p "${LOCALSTACK_DATA_DIR}"
mkdir -p "${LOCALSTACK_VOLUME_DIR}"

echo "Starting LocalStack with persistent storage..."
echo "Data directory: ${LOCALSTACK_DATA_DIR}"
echo "Volume directory: ${LOCALSTACK_VOLUME_DIR}"

# LocalStack configuration
export LOCALSTACK_VOLUME_DIR
export DATA_DIR="${LOCALSTACK_DATA_DIR}"
export PERSISTENCE=1
export DEBUG=1

# Common AWS services to enable (customize as needed)
# Uncomment and modify if you want to limit services
# export SERVICES=s3,dynamodb,sqs,sns,lambda,ec2

# Start LocalStack
# If installed via Homebrew, it typically uses the localstack CLI
localstack start -d

echo ""
echo "LocalStack started successfully!"
echo "Dashboard: http://localhost.localstack.cloud:4566/_localstack/health"
echo "Endpoint: http://localhost:4566"
echo ""
echo "To stop LocalStack, run: localstack stop"
