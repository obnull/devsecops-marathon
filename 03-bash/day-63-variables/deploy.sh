#!/bin/bash
# Usage: ./deploy.sh <environment> <version>

ENVIRONMENT=$1
VERSION=$2
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

echo "🚀 Deploying $ENVIRONMENT with version $VERSION"
echo "Deploy log: /var/log/deploy_${ENVIRONMENT}_${TIMESTAMP}.log"
echo "Deploy user: $USER"