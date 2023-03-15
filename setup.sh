#!/bin/bash

mkdir -p ~/dev/djvdorp/
cd ~/dev/djvdorp/
git clone -b zireael https://github.com/djvdorp/dotfiles.git

cd ~
ln -sf ~/dev/djvdorp/dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/dev/djvdorp/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dev/djvdorp/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dev/djvdorp/dotfiles/bin ~/
ln -sf ~/Dropbox/Notebooks/ ~/Notebooks
ln -sf ~/dev/djvdorp/dotfiles/.profile ~/.profile
mkdir -p ~/.workrave/
ln -sf ~/dev/djvdorp/dotfiles/.workrave/workrave.ini ~/.workrave/workrave.ini

mv ~/.config/i3 ~/.config/i3.bak
ln -sf ~/dev/djvdorp/dotfiles/.config/i3 ~/.config

mkdir -p ~/dev/ubuntu/
cd ~/dev/ubuntu/
git clone https://gitlab.com/wavexx/acpilight
cd acpilight
sudo make install
sudo usermod -a -G video daniel
