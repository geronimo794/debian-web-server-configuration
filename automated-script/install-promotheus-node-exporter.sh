#!/bin/bash

# Define version
VERSION_PROMOTHEUS_NODE_EXPORT="1.5.0"

# Download and extract prometheus 
wget https://github.com/prometheus/node_exporter/releases/download/v$VERSION_PROMOTHEUS_NODE_EXPORT/node_exporter-$VERSION_PROMOTHEUS_NODE_EXPORT.linux-amd64.tar.gz
tar xvfz node_exporter-$VERSION_PROMOTHEUS_NODE_EXPORT.linux-amd64.tar.gz
cd node_exporter-$VERSION_PROMOTHEUS_NODE_EXPORT.linux-amd64

# Create user service
sudo groupadd -f node_exporter
sudo useradd -g node_exporter --no-create-home --shell /bin/false node_exporter

# Copy node exporter data to system
sudo mv node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/bin/node_exporter


# Create system d configuration
echo '
[Unit]
Description=Node Exporter
Documentation=https://prometheus.io/docs/guides/node-exporter/
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
Restart=on-failure
ExecStart=/usr/bin/node_exporter \
  --web.listen-address=:'"$PORT_PROMOTHEUS_NODE_EXPORTER"'

[Install]
WantedBy=multi-user.target

' | sudo tee /etc/systemd/system/node_exporter.service
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
sudo systemctl status node_exporter

