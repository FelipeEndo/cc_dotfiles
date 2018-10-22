#!/bin/sh
sudo apt-get update
sudo apt-get install -y python-software-properties software-properties-common
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
echo 'Installing Chrome'
sudo apt-get install google-chrome-stable -y
echo 'Installing Spotify'
sudo snap install spotify
echo 'Installing Solarized'
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
~/.cc_dotfiles/gnome-terminal-colors-solarized/install.sh
curl -fsSL https://raw.githubusercontent.com/pwittchen/spotify-cli-linux/master/install.sh
sudo apt-get purge ruby
echo 'Change your terminal window to Run command as login shell and restart'
echo 'You can find more information about this on' \
     'https://github.com/rvm/ubuntu_rvm'
