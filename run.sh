#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y openssh-server
sudo service ssh start
sudo useradd -m -s /bin/bash ender
echo "ender:ender" | sudo chpasswd
sudo usermod -aG sudo ender
# Optional: Configure sudo without password (uncomment if needed)
# echo "ender ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ender
# sudo chmod 440 /etc/sudoers.d/ender
echo "User 'ender' created with sudo privileges at $(date)" >> /var/log/user_setup.log
