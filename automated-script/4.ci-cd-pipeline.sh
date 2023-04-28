#!/bin/bash

# Create docker configuration for volume and network
docker network create jenkins

docker compose up -d --build

docker logs jenkins-blueocean
