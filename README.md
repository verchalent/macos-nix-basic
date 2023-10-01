# Summary

This is a fork of https://github.com/zmre/mac-nix-simple-example created to learn Nix and adjust for my custom setup.

## Changes

Initial changes include:

* removing custom nvim
* changed from alacrity to wezterm
  * added custom lua for wezterm
* changed exa to lsd (exa no longer maintained)
* added zsh aliases for replacement tools
* moved brew to seperate config, added applications and configs
* allowed unfree
* Added deploy script
  * Injects correct username, system name and arch
  * clones repo
  * boostraps
  * TODO: cleanup custom config file conflicts from brew

