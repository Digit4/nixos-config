{
    pkgs,
    config,
    ...
}: {
    programs = {
        rofi = {
            enable = true;
            package = pkgs.rofi-wayland;

            extraConfig = {
                modi = "drun,filebrowser,run";
                show-icons = true;
                icon-theme = "Papirus";
                font = "Iosevka";
                display-drun = " Apps";
                display-run = " Run";
                display-filebrowser = " File";

            };
        };
    };
}