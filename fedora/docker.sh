#!/bin/bash

echo "Removing old docker versions (if any)..."
sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine

echo "Adding Docker repository..."
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo

echo "Installing Docker..."
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

if command -v docker &> /dev/null; then
    echo "Starting and enabling Docker service..."
    sudo systemctl enable --now docker

    echo "Running hello-world to verify installation..."
    sudo docker run hello-world

    echo "Docker installation complete!"
else
    echo "Docker is not installed."
fi