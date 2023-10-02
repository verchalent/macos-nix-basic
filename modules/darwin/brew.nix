{inputs, config, pkgs, ...}: {
  
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "uninstall";
    };
    global.brewfile = true;
    masApps = { };
    taps = [
        "homebrew/core"
        "homebrew/bundle"
        "homebrew/cask"
        "homebrew/cask-fonts"
        "homebrew/services"
        "fujiapple852/trippy" 
        ];
    casks = [ 
      {
        name = "bartender";
        greedy = true;
      }
      {
        name = "firefox";
        greedy = true;
      }
      {
        name = "obsidian";
        greedy = true;
      }
      {
        name = "raycast" ; 
        greedy = true;
      }
      {
        name = "signal";
        greedy = true;
      }
      {
        name = "spotify";
        greedy = true;
      }
      {
        name = "vscode";
        greedy = true;
      }     
      {
        name = "wezterm";
        greedy = true;
      }
    ];
    brews = [ "trippy" ];
  };
}