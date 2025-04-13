{
host,
inputs,
pkgs,
config,
username,
...
}: let
    inherit (import ../../hosts/${host}/variables.nix) animChoice waybarChoice;
    in {
    imports = [
        animChoice
        waybarChoice
        ./hyprland.nix
        ./hyprlock.nix
        ./hypridle.nix
        ./windowrules.nix
        ./binds.nix
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
    ];
}
