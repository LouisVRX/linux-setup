#! /bin/bash

sudo apt-get update
sudo apt-get upgrade -y

#
sudo apt-get install -y git vim apt-transport-https ca-certificates curl software-properties-common htop

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

#ssh key
ssh-keygen -t rsa -C $(hostname)

# Python
sudo apt-get install -y python-pip python3 python3-pip
python3 -m pip install --user vex
python3 -m pip install jedi
export PYTHONSTARTUP="$(python3 -m jedi repl)"

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER
sudo rm /usr/bin/docker-credential-secretservice
echo "alias dck='docker-compose'" >> ~/.bashrc

# For vex and docker-compose
echo 'export PATH=$PATH:/usr/local/bin:~/.local/bin/' >> ~/.bashrc

# vim llynch config
cd ~
git clone https://github.com/yohtm/vim-config.git vim-config
mv ~/.vimrc ~/.vimrc.old
mv ~/.vim ~/.vim.old
ln -s $(readlink -f vim-config/vimrc) ~/.vimrc
ln -s $(readlink -f vim-config/vim) ~/.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall  +qall
