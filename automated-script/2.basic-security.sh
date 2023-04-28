#!/bin/bash

# Change ssh port and ssh rule
# Update SSH configuration
sed -i 's/#Port 22/Port '"$PORT_SSH"'/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication no/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Install UFW
apt-get install -y ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow $PORT_SSH
ufw allow http
ufw allow https

# Install Let's Encrypt
sudo apt install certbot python3-certbot-nginx
# Test certbot status
sudo systemctl status certbot.timer

# Install Fail2ban
apt-get install -y fail2ban
# Copy configuration
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Restart the SSH service to apply the changes
systemctl restart sshd
systemctl restart fail2ban
ufw enable