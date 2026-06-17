#!/bin/bash

# Update packages
apt-get update -y

# Install Docker
apt-get install -y docker.io

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Add azureuser to Docker group
usermod -aG docker azureuser

# Verify Docker installation
docker --version > /tmp/docker-version.txt

# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Verify Azure CLI installation
az version > /tmp/azure-cli-version.txt

# Install useful tools
apt-get install -y unzip jq git

# Create installation log
echo "Docker and Azure CLI installation completed successfully" > /tmp/install-status.txt