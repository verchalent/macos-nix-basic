# Summary

This started as a fork of https://github.com/zmre/mac-nix-simple-example created to learn Nix and adjust for my custom setup. It is a mirror of my working configuration and a collection of solutions to issues I have hit along the way.

## Issues / Learnings

### P10K
I ran into issues getting Powerlevel 10k working with ZSH in nix. None of the solutions I found directly addressed my issues. My current solve was to:
1. Store my preffered config in modules\home-manager\dotfiles.p10k.zsh
2. Use home.files to place that file in my home dir
3. Move zsh specific settings to modules\home-manager\zsh.nix
4. Use zsh.nix to source p10k.zsh
5. Use zsh.nix to supress p10k first run behavior

### Powershell
In keeping with the nix spirit I want my powershell profile and module installs to be driven by nix. To accomplish this I use home.files to place my profile and lists of modules I want to use. Powershell then updates and installs modules at an interval when launched first the first time. Still looking for a bit more nix centric way.