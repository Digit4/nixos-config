{
    config,
    inputs,
    pkgs,
    ...
}: {
    programs.hyprlock = {
        enable = true;

        # package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;

        settings = {
            general = {
                disable_loading_bar = true;
                immediate_render = true;
                hide_cursor = false;
                no_fade_in = true;
            };

            animation = [
                "inputFieldDots, 1, 2, linear"
                "fadeIn, 0"
            ];

            # background = [
            #     {
            #         monitor = "";
            #         path = config.theme.wallpaper;
            #     }
            # ];

            # input-field = [
            #     {
            #         monitor = "eDP-1";

            #         size = "300, 50";
            #         valign = "bottom";
            #         position = "0% 10%";

            #         outline_thickness = 1;

            #         font_color = "rgb(b6c4ff)";
            #         outer_color = 
            #     }
            # ];
        };
    };
}