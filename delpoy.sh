#!/usr/bin/env bash

# Download repo
mkdir -p ~/src
curl https://github.com/verchalent/macos-nix-basic/archive/refs/heads/master.zip
cd src
unzip ~/Downloads/macos-nix-basic-master.zip

#Install nix
sh <(curl -L https://nixos.org/nix/install)

#Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Close this terminal and launch deploy2.sh"