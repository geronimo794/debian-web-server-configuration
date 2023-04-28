#!/bin/bash

# Load .env file
set -o allexport
source .env
set +o allexport

# Update all repository list
sudo apt update

# Install proxy-webserver
source ./1.proxy-webserver.sh

# Install basic security
source ./2.basic-security.sh

# Install containerization application
source ./3.containerization-application.sh

# Install ci-cd pipeline
source ./4.ci-cd-pipeline.sh

# Install monitoring
source ./5.monitoring.sh

# Done information
echo "Installation Done, check and make sure every service is work!"