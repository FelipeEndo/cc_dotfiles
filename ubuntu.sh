#!/bin/sh
sudo apt-get update
sudo apt-get install -y python-software-properties software-properties-common python-dbus
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
echo "Installing Spotify."
echo "======================================================"
echo
sudo snap install spotify
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/pwittchen/spotify-cli-linux/master/install.sh)"
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

echo "======================================================"
echo "Installing Rambox"
echo "======================================================"
echo

wget $(curl -s https://api.github.com/repos/ramboxapp/community-edition/releases | grep browser_download_url | grep '64[.]deb' | head -n 1 | cut -d '"' -f 4) -O rambox.deb
sudo dpkg -i rambox.deb
sudo apt-get install -f -y
sudo rm -f rambox.deb

echo "======================================================"
echo "Installing Solarized."
echo "======================================================"
echo

git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
~/.cc_dotfiles/gnome-terminal-colors-solarized/install.sh

echo 'Change your terminal window to Run command as login shell and restart'
echo 'You can find more information about this on' \
     'https://github.com/rvm/ubuntu_rvm'
