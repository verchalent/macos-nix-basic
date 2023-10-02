#!/usr/bin/env bash

#Install nix
sh <(curl -L https://nixos.org/nix/install)

#Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Close this terminal and launch deploy2.sh"