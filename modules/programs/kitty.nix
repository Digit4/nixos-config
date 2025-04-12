{
    programs.kitty = {
        enable = true;

        # has been deprecated
        themeFile = "Catppuccin-Mocha";

#         font = {
#             name = "Hack";
#             size = 16;
#         };
        keybindings = {
            "kitty_mod+e" = "kitten hints"; # https://sw.kovidgoyal.net/kitty/kittens/hints/
        };

        settings = {
            confirm_os_window_close = "0";
        };
    };
}
