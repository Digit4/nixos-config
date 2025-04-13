{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka" "Hack" ]; })
        fira-code
        iosevka
        # hack-mono
        # droid-sans-mono
    ];
}
