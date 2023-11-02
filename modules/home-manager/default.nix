{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./tmux.nix
    ];
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.05";
  # specify my home-manager configs
  home.packages = with pkgs; [
    awscli2
    curl
    fd
    less
    lsd
    mpv
    neovim
    podman
    powershell
    python3
    procs
    ripgrep
    tealdeer
    vimPlugins.tmux-nvim
    zsh-powerlevel10k
  ];

  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
  
  programs.bat = {
    enable = true;
    config.theme = "Dracula";
  };

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git.enable = true;

  programs.thefuck = {
    enable = true;
    enableZshIntegration = true;
  };

  # Symlinks for filesn ot managed natively by nix
  home.file.".inputrc".source = ./dotfiles/inputrc;
  home.file.".wezterm.lua".source = ./dotfiles/wezterm.lua;
  home.file.".p10k.zsh".source = ./dotfiles/p10k.zsh;
  home.file.".config/nvim/init.vim".source = ./dotfiles/nvim.rc;
  home.file.".config/nvim/init.lua".source=./dotfiles/nvim-plugins.lua;
  home.file.".config/powershell/Microsoft.PowerShell_profile.ps1".source=./pwsh/Microsoft.PowerShell_profile.ps1;
  home.file.".config/powershell/modules_aws.txt".source=./pwsh/modules_aws.txt;
  home.file.".config/powershell/modules.txt".source=./pwsh/modules.txt;
  
}
