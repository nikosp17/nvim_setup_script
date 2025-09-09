#!/bin/bash

# A bash script to quickly setup nvim in Debian-based distros. You need sudo to run the script.

sudo apt update && sudo apt install -y \
    build-essential \
    clang-format \
    curl \
    fd-find \
    git \
    neovim \
    nodejs \
    npm \
    pipx \
    python3 \
    python3-neovim \
    python3-pip \
    ripgrep \
    unzip

sudo npm install -g pyright typescript typescript-language-server

nvim --version

pipx ensurepath

pipx --version

rm -rf ~/.config/nvim # This will remove any existing nvim config and the following line will create a new one.

git clone git@github.com:nikosp17/Galahad_nvim_setup.git ~/.config/nvim # Replace xxxxx with your nvim config repo. 

## Go installation
curl -LO https://go.dev/dl/go1.25.1.linux-amd64.tar.gz ~/Downloads
cd ~/Downloads
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.25.1.linux-amd64.tar.gz # Remember to update the version number in the command above when a new version is released.
export PATH=$PATH:/usr/local/go/bin

go version

sudo rm -rf ~/Downloads/go1.25.1.linux-amd64.tar.gz # Remove the go package and clean the system

# Setup local python scripts

cd ~/.config/nvim/scripts/
pipx install .

exec $SHELL

# Install markdown support and preview for nvim.
sudo snap install glow
