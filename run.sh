#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -y
sudo apt-get install -y openssh-server
sudo systemctl enable ssh --now
sudo useradd -m -s /bin/bash ender
echo "ender:ender" | sudo chpasswd
sudo usermod -aG sudo ender
echo "User 'ender' created with sudo privileges at $(date)" >> /var/log/user_setup.log
