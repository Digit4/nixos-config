{
    programs.kitty = {
        enable = true;

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
