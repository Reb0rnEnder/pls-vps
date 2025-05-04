sudo apt-get update -y
sudo apt-get install openssh-server -y
sudo systemctl enable ssh --now
sudo systemctl start ssh
sudo useradd -m -s /bin/bash ender
echo "ender:ender" | sudo chpasswd
sudo usermod -aG sudo ender
