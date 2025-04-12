{
inputs,
pkgs,
config,
username,
...
}: {
    imports = [
        ./shell.nix
        ./common.nix
        ./utils.nix
        ./kitty.nix
        ./rofi.nix
    ];
}
