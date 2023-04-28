#!/bin/bash

# Install Promotheus on docker
docker compose -f docker-compose-promotheus.yml up -d --build

# Install node exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz
cd node_exporter-1.5.0.linux-amd64
./node_exporter


# Install Grafahana
docker compose -f docker-compose-promotheus.yml up -d --build
