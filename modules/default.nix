{
    pkgs,
    ...
}:{
    imports = [
        ./browser
        ./editors
        ./programs
        ./hyprland
        ./stylix.nix
        ./scripts
    ];
}