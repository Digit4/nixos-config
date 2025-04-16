{pkgs,username, ...}: {
    imports = [
        ../../home/core.nix

        # modules
        ../../modules

    ];

    # this is a declaration. without this it might break system so don't touch.
    # programs.zsh.enable = true;

    programs.git = {
        userName = "Digit4";
        userEmail = "dhaval.pantojee@gmail.com";
    };
}
