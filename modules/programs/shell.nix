{pkgs, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            update = "sudo nixos-rebuild switch --flake \"~/hyprland-nixos#nixos\"";
        };

        history.size = 10000;
        history.ignoreAllDups = true;
        history.path = "$HOME/.zsh_history";
        history.ignorePatterns = ["rm *" "pkill *" "cp *"];
    };

    # starship for my zsh (to be coming)
    programs.starship = {
        enable = true;

        # custom settings
        settings = {
            add_newline = false;
            aws.disabled = true;
            gcloud.disabled = true;
            line_break.disabled = true;
        };
    };

    programs.zsh.initExtra = ''
        eval "$(starship init zsh)"
    '';
}
