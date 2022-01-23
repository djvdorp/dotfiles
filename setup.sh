#!/bin/bash

mkdir -p ~/dev/djvdorp/
cd ~/dev/djvdorp/
git clone -b ophelia git@github.com:djvdorp/dotfiles.git

cd ~
ln -sf ~/dev/djvdorp/dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/dev/djvdorp/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dev/djvdorp/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dev/djvdorp/dotfiles/bin/ ~/bin
ln -sf ~/Dropbox/Notebooks/ ~/Notebooks
ln -sf ~/dev/djvdorp/dotfiles/.profile ~/.profile

ln -sf ~/dev/djvdorp/dotfiles/.config/i3/ ~/.config/i3
