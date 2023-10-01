#!/usr/bin/env bash

#vars
if [$(uname -o) = 'Darwin']; then
     aarch="$(uname -m)-Darwin"
else
    aarch="$(uname -m)-linux"
fi
uname=$(whoami)
sysname=$(hostname -s)

#Install nix
sh <(curl -L https://nixos.org/nix/install)

#Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

mkdir -p ~/src
cd ~/src
git clone https://github.com/verchalent/macos-nix-basic.git
cd macos-nix-basic

# Replace System Name, Username and Arch with correct values for system
sed -i "s/SYSTEMNAME/$sysname/g" flake.nix
sed -i "s/USERNAME/$uname/g" flake.nix
sed -i "s/ARCH/$aarch/g" flake.nix

# Add changed items back to local git to allow build
git add .

# Bootstrap Nix Darwin
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer ./result/bin/darwin-installer

# Init Flake
nix  --extra-experimental-features "nix-command flakes" run nix-darwin -- switch --flake ~/src/macos-nix-basic