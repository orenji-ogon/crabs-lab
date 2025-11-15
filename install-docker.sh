#!/bin/bash
# Docker installation script for Debian(Ubuntu/Pop!_OS)

# create .sh file
# nano install-docker.sh
# copy/paste/save this script to your Debian flavour of choice
# Make it executable:
# chmod +x install-docker.sh
# Run it:
# sudo ./install-docker.sh



set -e  # Exit immediately if a command fails

echo "Updating package index..."
sudo apt update -y
sudo apt upgrade -y

echo "Installing prerequisites..."
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "Adding Docker’s official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker Engine..."
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "Testing Docker installation..."
sudo docker run hello-world

echo "Docker installation complete!"
echo "You may need to log out and back in for group changes to take effect."
