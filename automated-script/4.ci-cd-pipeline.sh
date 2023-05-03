#!/bin/bash

# Load .env file
set -o allexport
if [ ! -f .env ]; then
	source format.env
else
	source .env
fi
set +o allexport

# Create docker configuration for volume and network
sudo docker network create jenkins
sudo docker compose -f docker-compose-jenkins.yml up -d --build

# Get server ip address
SERVER_IP_ADDRESS=$(curl ifconfig.me/ipifconfig.me/ip)

# Confirmation and setup on browser
echo 
echo "Manual configuration:"
echo "1. Access your Jenkins via browser at: http://"$SERVER_IP_ADDRESS":"$PORT_JENKINS
echo "2. Wait until docker jenkins installation is done"
echo "3. Open another terminal, and execute 'sudo docker logs jenkins-blueocean'"
echo "4. Copy the password"
echo "5. And paste your password ont the browser"
read -p "Press enter to continue the process!"