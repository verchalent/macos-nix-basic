{ pkgs, pwnvim, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.05";
  # specify my home-manager configs
  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
    lsd
    procs
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark";
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.shellAliases = {
    ls = "lsd";
    cat = "bat";
    find = "fd";
    vi = "nvim";
    ll = "lsd -l";
    ps = "procs";
    nixswitch = "darwin-rebuild switch --flake ~/src/system-config/.#";
    nixup = "pushd ~/src/system-config; nix flake update; nixswitch; popd";
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.alacritty = {
    enable = true;
    settings.font.normal.family = "MesloLGS Nerd Font Mono";
    settings.font.size = 16;
  };
  home.file.".inputrc".source = ./dotfiles/inputrc;
  home.file.".wezterm.lua".source = ./dotfiles/wezterm.lua;
}
