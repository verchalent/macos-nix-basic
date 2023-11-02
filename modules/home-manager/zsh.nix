{inputs, config, pkgs, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableAutosuggestions = true;
        syntaxHighlighting.enable = true;

        initExtra = ''
        [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
        '';
       plugins = [
         {
           name = "powerlevel10k";
           src = pkgs.zsh-powerlevel10k;
           file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
         }
       ];

        localVariables = {
            POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD = true;
            ZSH_THEME = "powerlevel10k/powerlevel10k";
        };

        shellAliases = {
            cat = "bat";
            explorer = "open";  
            find = "fd";
            la = "lsd -la";
            ll = "lsd -l";
            ls = "lsd";
            nixswitch = "darwin-rebuild switch --flake ~/src/macos-nix-basic/.#";
            nixup = "pushd ~/src/macos-nix-basic; nix flake update; nixswitch; popd"; #update env based on latest config
            nixclean = "nix-store --gc"; # Clean local nix store
            powershell = "pwsh";
            ps = "procs";    
            vi = "nvim";
        };
    };
}