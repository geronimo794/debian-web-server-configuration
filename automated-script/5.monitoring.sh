#!/bin/bash

# Load .env file
set -o allexport
source .env
set +o allexport


# Install Promotheus on docker
sudo docker compose -f docker-compose-promotheus.yml up -d --build

# Install Grafahana
sudo docker compose -f docker-compose-grafana.yml up -d --build

# Install node exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz
cd node_exporter-1.5.0.linux-amd64
./node_exporter --web.listen-address=:$PORT_PROMOTHEUS_NODE_EXPORTER
