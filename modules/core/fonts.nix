{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka" "JetBrainsMono" ]; })
        fira-code
        iosevka
        jetbrains-mono
        # hack-mono
        # droid-sans-mono
    ];
}
