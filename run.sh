#!/bin/bash
# Unattended script to update system, install SSH, and create sudo user 'ender'

# Set environment variable to avoid prompts
export DEBIAN_FRONTEND=noninteractive

# Update and install SSH non-interactively
sudo apt-get update -y
sudo apt-get install -y openssh-server

# Start SSH service using service command (for containers without systemd)
sudo service ssh start

# Create user 'ender' non-interactively
sudo useradd -m -s /bin/bash ender

# Set password for user 'ender' without prompt
echo "ender:ender" | sudo chpasswd

# Add user to sudo group
sudo usermod -aG sudo ender

# Optional: Configure sudo without password (uncomment if needed)
# echo "ender ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ender
# sudo chmod 440 /etc/sudoers.d/ender

# Log the completion for verification
echo "User 'ender' created with sudo privileges at $(date)" >> /var/log/user_setup.log
