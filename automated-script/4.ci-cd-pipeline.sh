#!/bin/bash

# Create docker configuration for volume and network
sudo docker network create jenkins
sudo docker compose -f docker-compose-jenkins.yml up -d --build

# Confirmation and setup on browser
echo 
echo "Open your terminal, and execute 'sudo docker logs jenkins-blueocean'"
echo "Copy the password"
echo "Access your Jenkins via browser at: http://..."
echo "And paste your password ont the browser"
read -p "Press enter to continue the process!"