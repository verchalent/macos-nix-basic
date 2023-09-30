{ pkgs, ... }: {
  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [ bash zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  fonts.fontDir.enable = true; # DANGER
  fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "Meslo" "JetBrains" ]; }) ];
  services.nix-daemon.enable = true;
  system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    dock.autohide = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };

  system = {
  
    stateVersion = 4;

    defaults = {
      
      dock = {
        autohide = true;
        show-recents = false;
        launchanim = true;
        mouse-over-hilite-stack = true;
        orientation = "bottom";
        tilesize = 48;
      };
    
      finder = {
        _FXShowPosixPathInTitle = true;
      };
      
      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
  }
  
  # Homebrew section - Move this to a seperate config?
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = { };
    taps = [ "fujiapple852/trippy" ];
    casks = [ 
      {
        name = "alfred" ; #spotlight replacement
        greedy = true;
      }
      {
        name = "wezterm" ; #fancy terminal
        greedy = true;
      }
            {
        name = "spotify" ; #music
        greedy = true;
      }
      {
        name = "bartender"; # organize status bar
        greedy = true;
      }
    ];
    brews = [ "trippy" ];
  };
}
