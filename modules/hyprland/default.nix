{
inputs,
pkgs,
config,
username,
...
}: {
    imports = [
        ./hyprland.nix
        ./hyprlock.nix
        ./hypridle.nix
    ];

#     programs.hyprland = {
#         enable = true;
#
#         # set the flake package
#         package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
#         # make sure to also set the portal package, so that they are in sync
#         portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
#     };

    home.packages = with pkgs; [
        waybar
        swww
        dunst
        libnotify

        rofi-wayland
    ];

    wayland.windowManager.hyprland  = {
        enable = true;
        package = pkgs.hyprland;
        systemd = {
            enable = true;
            enableXdgAutostart = true;
            variables = ["--all"];
        };

        xwayland.enable = true;


        extraConfig = ''

            ${builtins.readFile ../../configs/hyprland.conf}
        '';
    };
}
