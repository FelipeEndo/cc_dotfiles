#!/bin/sh
sudo apt-get update
sudo apt-get install -y python-software-properties software-properties-common python-dbus \
apt-transport-https ca-certificates
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y silversearcher-ag \
 zsh \
 tmux \
 dconf-cli \
 vim-gnome

echo "======================================================"
echo "Installing Google Chrome."
echo "======================================================"
echo
sudo apt-get install google-chrome-stable -y

echo "======================================================"
echo "Installing Docker and Docker Compose."
echo "======================================================"
echo

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-get install ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(grep "UBUNTU_CODENAME" /etc/os-release | awk -F= '{ print $2 }') \
  stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "======================================================"
echo "Granting Docker privileges."
echo "======================================================"
echo
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

COMPOSE_VERSION = curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
sudo curl -L "https://github.com/docker/compose/releases/download/$(COMPOSE_VERSION)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "======================================================"
echo "Installing Solarized."
echo "======================================================"
echo

git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
~/.cc_dotfiles/gnome-terminal-colors-solarized/install.sh

echo 'Change your terminal window to Run command as login shell and restart'
echo 'You can find more information about this on' \
     'https://github.com/rvm/ubuntu_rvm'
