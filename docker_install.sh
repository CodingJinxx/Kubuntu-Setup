#!/usr/bin/env bash

echo "Installing Docker"
# Docker Install
sudo apt-get remove -y docker docker-engine docker.io containerd runc 
sudo apt-get update -y
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo "Docker 1/3"
if ! [ $(getent group docker) ]; then
  sudo groupadd docker
fi
sudo usermod -aG docker $USER
newgrp docker 
sudo docker run hello-world
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
echo "Docker 2/3"
sudo chmod g+rwx "$HOME/.docker" -R
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo apt-get install docker-compose
echo "Docker 3/3"
echo "Installed Docker"

