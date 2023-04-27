#!/bin/bash

# Load .env file

# Install nginx

# Install UFW

# Install Let's Encrypt

# Install Fail2Ban

# Install Docker

# Install Jenkins on Docker

# Install Promotheus on Docker

# Install Promotheus Node Exporter

# Install Grafana on Docker

# Define the new SSH port
SSH_PORT=2020

# Update SSH configuration
sed -i 's/#Port 22/Port 2000/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Restart the SSH service to apply the changes
systemctl restart sshd

# Output a message to confirm that the script has finished executing
echo "SSH configuration has been updated. SSH port: $NEW_PORT, PermitRootLogin: no, PubkeyAuthentication: yes, PasswordAuthentication: no."
