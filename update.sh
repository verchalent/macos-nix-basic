#!/usr/bin/env bash

# FIX Me for public repo!

cd ~/src/macos-nix-basic
#git restore .
#git pull https://github.com/verchalent/macos-nix-base.git master

#vars
if (($(uname -o) == "Darwin")); then
     aarch="$(uname -m)-darwin"
else
    aarch="$(uname -m)-linux"
fi

uname=$(whoami)
sysname=$(hostname -s)

# Replace System Name, Username and Arch with correct values for system
sed -i '' -e "s/SYSTEMNAME/$sysname/g" flake.nix
sed -i '' -e "s/USERNAME/$uname/g" flake.nix
sed -i '' -e "s/USERNAME/$uname/g" ./modules/darwin/default.nix
sed -i '' -e "s/ARCH/$aarch/g" flake.nix

#pushd ~/src/macos-nix-basic; nix flake update; nixswitch; popd
