#!/bin/bash

# Update repository
sudo apt-get update

# Load .env file
set -o allexport
if [ ! -f .env ]; then
	source format.env
else
	source .env
fi
set +o allexport

# SSH Port reconfiguration(PERSONAL CONFIGURATION)
# Change default SSH Port
sudo sed -i 's/#Port 22/Port '"$PORT_SSH"'/' /etc/ssh/sshd_config

# Change default root login
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Allow pubkey auth
sudo sed -i 's/#PubkeyAuthentication no/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config

# Disable password authentification
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication no/PasswordAuthentication no/' /etc/ssh/sshd_config

# Install UFW
sudo apt-get install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow http
sudo ufw allow https

# Allow additional port for application
sudo ufw allow $PORT_SSH
sudo ufw allow $PORT_JENKINS
sudo ufw allow $PORT_PROMOTHEUS
sudo ufw allow $PORT_PROMOTHEUS_NODE_EXPORTER
sudo ufw allow $PORT_GRAFANA

# Install Let's Encrypt
sudo apt-get install -y certbot python3-certbot-nginx

# Test certbot status
# sudo systemctl status certbot.timer

# Install Fail2ban
sudo apt-get install -y fail2ban
# Copy configuration
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Restart the SSH service to apply the changes
sudo systemctl restart sshd
sudo systemctl restart fail2ban
sudo ufw enable