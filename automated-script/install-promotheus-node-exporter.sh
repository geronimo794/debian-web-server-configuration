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

echo "--------------------------------------------------------------"
echo "Check prometheus status..."
echo "Press 'Q' after the status is shown"
echo "--------------------------------------------------------------"

sudo systemctl status node_exporter

# Enable nginx reverse proxy
if [ ! -z "$URL_PROMOTHEUS_NODE_EXPORTER" ]
then
	echo '

# Generated by Rozikin Script
server {
	server_name '"$URL_PROMOTHEUS_NODE_EXPORTER"';
	listen 80;
	location / {
			proxy_ssl_server_name on;
			proxy_set_header Host $host;
			proxy_set_header Upgrade $http_upgrade;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			proxy_pass http://127.0.0.1:'"$PORT_PROMOTHEUS_NODE_EXPORTER"'/;
	}
}

	' | sudo tee /etc/nginx/sites-available/$PORT_PROMOTHEUS_NODE_EXPORTER.$URL_PROMOTHEUS_NODE_EXPORTER
	sudo ln -s /etc/nginx/sites-available/$PORT_PROMOTHEUS_NODE_EXPORTER.$URL_PROMOTHEUS_NODE_EXPORTER /etc/nginx/sites-enabled/$PORT_PROMOTHEUS_NODE_EXPORTER.$URL_PROMOTHEUS_NODE_EXPORTER 
	sudo systemctl restart nginx
	sudo certbot --nginx -d $URL_PROMOTHEUS_NODE_EXPORTER

	echo "--------------------------------------------------------------"
	echo "Your Prometheus Node Exporter now accessible on: https://"$URL_PROMOTHEUS_NODE_EXPORTER
	echo "--------------------------------------------------------------"
	# Sleep 10 second to next process
	echo "Sleep 10 second to the next process"
	sleep 10s
else
	sudo ufw allow $PORT_PROMOTHEUS_NODE_EXPORTER/
fi

