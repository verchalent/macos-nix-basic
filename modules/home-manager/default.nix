{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.05";
  # specify my home-manager configs
  home.packages = with pkgs; [
    awscli2
    curl
    fd
    less
    lsd
    neovim
    powershell
    procs
    ripgrep
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
  programs.bat.enable = true;
  programs.bat.config.theme = "Dracula";
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.SyntaxHighlighting.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };
  programs.zsh.shellAliases = {
    ls = "lsd";
    cat = "bat";
    find = "fd";
    vi = "nvim";
    ll = "lsd -l";
    ps = "procs";
    nixswitch = "darwin-rebuild switch --flake ~/src/macos-nix-basic/.#";
    nixup = "pushd ~/src/macos-nix-basic; nix flake update; nixswitch; popd";
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  home.file.".inputrc".source = ./dotfiles/inputrc;
  home.file.".wezterm.lua".source = ./dotfiles/wezterm.lua;
}
