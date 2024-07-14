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
 snap \
 picom


echo "======================================================"
echo "Install Kitty"
echo "======================================================"
echo
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin
# is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop
~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also
# add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop
~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)
sed -i "s|Icon=kitty|Icon=$(readlink -f
~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g"
~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g"
~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use
# kitty)
echo 'kitty.desktop' > ~/.config/xdg-terminals.list


echo "======================================================"
echo "Install Neovim"
echo "======================================================"
echo
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo export PATH="$PATH:/opt/nvim-linux64/bin" >> ~/. zshrc
echo source ~/.vimrc >> ~/.config/nvim/init.vim

echo "======================================================"
echo "Config Neovim"
echo "======================================================"
echo
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


echo "======================================================"
echo "Install OhMyZsh"
echo "======================================================"
echo

echo "======================================================"
echo "Install Awesome WM"
echo "======================================================"
echo
sudo apt install awesome

echo "======================================================"
echo "Install Awesome WM themes and dependencies"
echo "======================================================"
echo
git clone https://github.com/Relz/awesome-wm-theme.git ~/.config/awesome
# Install ulauncher
sudo add-apt-repository universe -y && sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install ulauncher
# # battery status dependency
# sudo apt-get install acpi
# #battery icons
# git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
# ./autogen.sh --prefix=/usr
# sudo make install
# #other icons
# git clone https://github.com/streetturtle/awesome-wm-widgets
# git clone https://github.com/streetturtle/awesome-buttons
# # volume controll
# sudo apt install pavucontrol


echo "======================================================"
echo "Install Spotify"
echo "======================================================"
echo
sudo snap install spotify

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
echo "Install LightDM"
echo "======================================================"
echo
sudo apt install lightdm

echo 'Change your terminal window to Run command as login shell and restart'
echo 'You can find more information about this on' \
     'https://github.com/rvm/ubuntu_rvm'
