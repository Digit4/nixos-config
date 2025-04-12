{pkgs,username, ...}: {
    imports = [
        ../../home/core.nix

        # modules
        ../../modules/browser/firefox.nix
        ../../modules/editors
        ../../modules/programs
        ../../modules/hyprland

    ];

    # this is a declaration. without this it might break system so don't touch.
    programs.zsh.enable = true;

    programs.git = {
        userName = "Digit4";
        userEmail = "dhaval.pantojee@gmail.com";
    };
}
