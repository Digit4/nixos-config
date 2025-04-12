{pkgs,
inputs,
config,
...
}: {

    home = {
        sessionVariables = {
            BROWSER = "firefox";
            TERMINAL = "kitty";

            # If your cursor becomes invidisble
            WLR_NO_HARDWARE_CURSORS = "1";

            # Hint electron apps to use wayland
            NIXOS_OZONE_WL = "1";
        };
    };
}
