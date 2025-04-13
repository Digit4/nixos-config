{
pkgs,
...
}:{
    imports = [
        ../../modules/core
    ];


    # xdg.configFile.nvim.source = ./nvim;


    # make zsh my user's default shell
    users.users.digit4 = {
        isNormalUser = true;
        shell = pkgs.zsh;
        # NOTE BE VERY CAREFUL WITH THIS PROMPT. IF YOU'VE NOT SETUP THE ZSH PROPERLY
        # IT WILL KILL THE SYSTEM.
        # preferably remove both prompts if you're messing with shell.nix
        # ignoreShellProgramCheck = true;
        extraGroups = ["networkmanager" "wheel"];

        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIErYozwvKtEfeJM/ZmxCK8tJMXHLVVm3qeT/6zCrvMgo digit4@nixos"
        ];
    };

    # I'm gonna use this instead of ignore shell program check. much safer
    programs.zsh.enable = true;
}
