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

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce docker-compose -y
sudo usermod -aG docker $USER

# Python
sudo apt-get install -y python-pip python3 python3-pip bpython3 python3-numpy python3-opencv
python3 -m pip install --user vex
python3 -m pip install tornado setuptools pandas matplotlib seaborn jedi cython
export PYTHONSTARTUP="$(python3 -m jedi repl)"
