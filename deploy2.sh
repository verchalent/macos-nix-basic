#!/usr/bin/env bash

# TO DO - move flake corrections to seperate file. This will allow for updates from github and corrections without needing to rebuild.

#vars
if (($(uname -o) == "Darwin")); then
     aarch="$(uname -m)-darwin"
else
    aarch="$(uname -m)-linux"
fi

uname=$(whoami)
sysname=$(hostname -s)

# Replace System Name, Username and Arch with correct values for system
sed -i "s/SYSTEMNAME/$sysname/g" flake.nix
sed -i "s/USERNAME/$uname/g" flake.nix
sed -i "s/USERNAME/$uname/g" ./modules/darwin/default.nix
sed -i "s/ARCH/$aarch/g" flake.nix

# Add changed items back to local git to allow build
git init
git add .

# Below this line may need to be in new terminal
# Bootstrap Nix Darwin
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer ./result/bin/darwin-installer

# Init Flake
nix  --extra-experimental-features "nix-command flakes" run nix-darwin -- switch --flake ~/src/macos-nix-basic