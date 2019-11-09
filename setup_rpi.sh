#! /bin/bash

sudo apt-get update
sudo apt-get upgrade -y

#
sudo apt-get install -y git vim apt-transport-https ca-certificates curl software-properties-common htop

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#ssh key
ssh-keygen -t rsa -C $(hostname)

# Python
sudo apt-get install -y python3 python3-pip python3-numpy
python3 -m pip install --user vex
python3 -m pip install setuptools jedi cython
export PYTHONSTARTUP="$(python3 -m jedi repl)"


# vim llynch config
cd ~
git clone https://github.com/yohtm/vim-config.git vim-config
mv ~/.vimrc ~/.vimrc.old
mv ~/.vim ~/.vim.old
ln -s $(readlink -f vim-config/vimrc) ~/.vimrc
ln -s $(readlink -f vim-config/vim) ~/.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall  +qall
