#!/usr/bin/env bash
cd ~/src/macos-nix-basic
git restore .
git pull https://github.com/verchalent/macos-nix-base.git master

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

pushd ~/src/macos-nix-basic; nix flake update; nixswitch; popd