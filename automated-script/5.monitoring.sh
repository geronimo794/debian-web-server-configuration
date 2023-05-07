#!/bin/bash

# Load .env file
set -o allexport
if [ ! -f .env ]; then
	source format.env
else
	source .env
fi
set +o allexport


# Install Promotheus on docker
sudo docker compose -f docker-compose-promotheus.yml up -d --build

# Install Grafahana
sudo docker compose -f docker-compose-grafana.yml up -d --build

# Install node exporter
chmod +x install-promotheus-node-exporter.sh
source ./install-promotheus-node-exporter.sh
