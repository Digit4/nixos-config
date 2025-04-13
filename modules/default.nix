{
    pkgs,
    ...
}:{
    imports = [
        ./browser
        ./editors
        ./programs
        ./scripts
        ./hyprland
        ./stylix.nix
    ];
}