#!/bin/bash

# Create docker configuration for volume and network
docker network create jenkins

docker compose -f docker-compose.yml up -d --build

docker logs jenkins-blueocean
