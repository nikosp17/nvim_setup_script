#!/bin/bash

# A bash script to quickly setup nvim in Debian-based distros. You need sudo to run the script.

# Install basic dependencies through apt and npm.
sudo apt update && sudo apt install -y \
    build-essential \
    clang-format \
    curl \
    fd-find \
    git \
    nodejs \
    npm \
    pipx \
    python3 \
    python3-neovim \
    python3-pip \
    ripgrep \
    unzip

sudo npm install -g pyright typescript typescript-language-server

# Install nvim through AppImage to get the latest version

sudo mkdir -p /opt/nvim
sudo curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage /opt/nvim/
echo "What shell are you using? Select of the following: 1) zsh, 2) bash"
read user_input

if [$user_input -eq 1]; then
    sed -i '$a\export PATH="$PATH:/opt/nvim/"' ~/.zshrc
elif [$user_input -eq 2]; then
    sed -i '$a\export PATH="$PATH:/opt/nvim/"' ~/.bashrc
else
    exit 1
fi 

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
