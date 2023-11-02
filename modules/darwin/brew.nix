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
    masApps = { }; # Move to seperate file
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
# Brew gets mad if this is already on the system. Need to fix config.
#     {
#        name = "firefox";
#        greedy = true;
#      }
      {
        name = "geany"; #notepad++ replacement
        greedy = true;
      }
      {
        name = "microsoft-edge"; #Edge for use with M365 items 
        greedy = true;
      }
      {
        name = "obsidian"; #2nd Brain
        greedy = true;
      }
      {
        name = "podman-desktop"; #control pods
        greedy = true;
      }
      {
        name = "raycast" ; #Spotlight replacement
        greedy = true;
      }
      {
        name = "signal"; #Desktop client for Signal
        greedy = true;
      }
      {
        name = "spotify"; #Muzak
        greedy = true;
      }
      {
        name = "visual-studio-code"; #Make code pretty
        greedy = true;
      }     
      {
        name = "wezterm"; #Replacement for iTerm
        greedy = true;
      }
      {
        name = "wireshark"; #Network packat analysis
        greedy = true;
      }
    ];
    brews = [ "trippy" ]; 
  };
}
