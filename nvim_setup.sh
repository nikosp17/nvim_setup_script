#!/bin/bash

# A bash script to quickly setup nvim in Debian-based distros.

sudo apt update && sudo apt install -y \
    curl \
    git \
    neovim \
    python3-neovim \
    ripgrep \
    fd-find \
    npm \
    build-essential
    nodejs \
    npm \ 
    python3 \
    python3-pip \
    unzip \
    pipx \
    clang-format \ 
    curl

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
cd ~/.config/nvim/scripts
pipx install .

# Fix Mason permission.
sudo chown -R $(whoami):$(whoami) ~/.local/share/nvim

# Remove broken Mason packages (if any).
rm -rf ~/.local/share/nvim/mason/staging/pyright
rm -rf ~/.local/share/nvim/mason/staging/typescript-language-server
rm -rf ~/.local/share/nvim/mason/packages/pyright
rm -rf ~/.local/share/nvim/mason/packages/typescript-language-server

exec $SHELL

# Install markdown support and preview for nvim.
sudo snap install glow
