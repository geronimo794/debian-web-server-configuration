#!/bin/bash

# Disable lang forwarding from client to ssh server
# Optional
chmod +x disable-lang-forwarding-sshd.sh
source ./disable-lang-forwarding-sshd.sh

# Load .env file
set -o allexport
source .env
set +o allexport

# Update all repository list
sudo apt update

chmod +x 1.proxy-webserver.sh 2.basic-security.sh 3.containerization-application.sh 4.ci-cd-pipeline.sh 5.monitoring.sh

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
