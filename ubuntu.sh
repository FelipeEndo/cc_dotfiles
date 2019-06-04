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
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update

echo "======================================================"
echo "Installing Google Chrome."
echo "======================================================"
echo
sudo apt-get install google-chrome-stable -y

echo "======================================================"
echo "Installing Rambox"
echo "======================================================"
echo

wget $(curl -s https://api.github.com/repos/ramboxapp/community-edition/releases | grep browser_download_url | grep '64[.]deb' | head -n 1 | cut -d '"' -f 4) -O rambox.deb
sudo dpkg -i rambox.deb
sudo apt-get install -f -y
sudo rm -f rambox.deb

echo "======================================================"
echo "Installing Docker and Docker Compose."
echo "======================================================"
echo

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update
sudo apt-get install -y docker-ce


sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "======================================================"
echo "Granting Docker privileges."
echo "======================================================"
echo
sudo groupadd docker
sudo usermod -aG docker $USER

echo "======================================================"
echo "Installing Solarized."
echo "======================================================"
echo

git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
~/.cc_dotfiles/gnome-terminal-colors-solarized/install.sh

echo 'Change your terminal window to Run command as login shell and restart'
echo 'You can find more information about this on' \
     'https://github.com/rvm/ubuntu_rvm'
