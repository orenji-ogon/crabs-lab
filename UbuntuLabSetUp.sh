#!/bin/bash
# Ubuntu VM Lab Setup Script
# Prepares environment for Python, Bash, MySQL, VSCodium, and Spice remote desktop

set -e

echo "=== Updating system ==="
sudo apt update && sudo apt upgrade -y

echo "=== Installing Spice guest tools ==="
sudo apt install -y spice-vdagent qemu-guest-agent xserver-xorg-video-qxl

echo "=== Installing MySQL Server ==="
sudo apt install -y mysql-server
sudo systemctl enable mysql
sudo systemctl start mysql

echo "=== Securing MySQL installation ==="
sudo mysql_secure_installation <<EOF
y
Query123^!
Query123^!
y
y
y
y
EOF

echo "=== Creating coursework MySQL user ==="
# Change 'student' to whatever username you want.
# Change 'StrongPassword123!' to your chosen password.

sudo mysql -u root -p Query123^! <<EOF
CREATE USER 'crabbylabster'@'%' IDENTIFIED BY 'Query123^!';
GRANT ALL PRIVILEGES ON *.* TO 'crabbylabster'@'%';
FLUSH PRIVILEGES;
EOF

echo "=== Installing MySQL Workbench ==="
sudo apt install -y mysql-workbench

echo "=== Installing Python3 and pip ==="
sudo apt install -y python3 python3-pip

echo "=== Installing VSCodium ==="
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb/raw/master/pub.gpg \
  | sudo gpg --dearmor -o /usr/share/keyrings/vscodium.gpg
echo 'deb [signed-by=/usr/share/keyrings/vscodium.gpg] \
  https://download.vscodium.com/debs vscodium main' \
  | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update
sudo apt install -y codium

echo "=== Bash tweaks (aliases) ==="
echo "alias ll='ls -la'" >> ~/.bashrc
echo "alias gs='git status'" >> ~/.bashrc
source ~/.bashrc

echo "=== Setup complete! ==="
echo "You can now:"
echo "- Use Remmina to RDP into VM (Spice/QXL enabled)"
echo "- Run MySQL CLI: mysql -u student -p"
echo "- Launch MySQL Workbench from Applications"
echo "- Start coding in Python or Bash"
echo "- Use VSCodium for development"
