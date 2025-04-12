{
    host,
    pkgs,
    inputs,
    config,
...
}: let
    inherit
    (import ../../hosts/${host}/variables.nix)
    extraMonitorSettings
    keyboardLayout
    stylixImage
    ;
    in {

    home.packages = with pkgs; [
        swww
        grim
        slurp
        wl-clipboard
        swappy
        hyprpolkitagent
        # hyprland-qtutils
    ];

    systemd.user.targets.hyprland-session.Unit.Wants = [
        "xdg-desktop-autostart.target"
    ];

    home.file = {
        "Pictures/Wallpapers" = {
            source = ../../wallpapers;
            recursive = true;
        };
    };

    wayland.windowManager.hyprland  = {
        enable = true;
        package = pkgs.hyprland;
        systemd = {
            enable = true;
            enableXdgAutostart = true;
            variables = ["--all"];
        };

        xwayland.enable = true;

        settings = {
            exec-once = [
                "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
                "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
                "systemctl --user start hyprpolkitagent"
                "killall -q swww;sleep .5 && swww init"
                "killall -q waybar;sleep .5 && waybar"
                "killall -q swaync;sleep .5 && swaync"
                "nm-applet --indicator"
                "pypr &"
                "sleep 1.5 && swww img ${stylixImage}"
            ];

            input = {
                kbLayout = "${keyboardLayout}";
                kbOptions = [
                    "caps:super"
                ];
                numlock_by_default = true;
                repeat_delay = 300;
                follow_mouse = 1;
                float_switch_override_focus = 0;
            };

            general = {
                "$modifier" = "SUPER";
                layout = "dwindle";
                gaps_in = 6;
                gaps_out = 8;
                border_size = 2;
                resize_on_border = true;
                # "col.active_border" = "rgb(${config.lib.stylix.colors.base08}) rgb(${config.lib.stylix.colors.base0C}) 45deg";
                # "col.inactive_border" = "rgb(${config.lib.stylix.colors.base01})";
            };

            misc = {
                layers_hog_keyboard_focus = true;
                initial_workspace_tracking = 0;
                mouse_move_enables_dpms = true;
                key_press_enables_dpms = false;
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
                enable_swallow = false;
                vfr = true;   # Variable Frame Rate 
                vrr = 2;   #Variable Refresh Rate  Might need to set to 0 for NVIDIA/AQ_DRM_DEVICES
                # Screen flashing to black momentarily or going black when app is fullscreen
                # Try setting vrr to 0
            }; 

            dwinde = {
                pseudotile = true;
                preserve_split = true;
            };

            decoration = {
                rounding = 10;
                blur = {
                    enabled = true;
                    size = 5;
                    passes = 3;
                    ignore_opacity = false;
                    new_optimizations = true;
                };
                shadow = {
                    enabled = true;
                    range = 4;
                    render_power = 3;
                    color = "rgba(1a1a1aee)";
                };
            };

            cursor = {
                # sync_gsetting_theme = true;
                no_hardware_cursors = 2;
                enable_hyprcursor = false;
                warp_on_change_workspace = 2;
                no_warps = true;
            };

            render = {
                explicit_sync = 1;
                explicit_sync_kms = 1;
                direct_scanout = 0;
            };

            master = {
                new_status = "master";
                new_on_top = 1;
                mfact = 0.5;
            };

            env = [
                "NIXOS_OZONE_WL, 1"
                "NIXPKGS_ALLOW_UNFREE, 1"
                "XDG_CURRENT_DESKTOP, Hyprland"
                "XDG_SESSION_TYPE, wayland"
                "XDG_SESSION_DESKTOP, Hyprland"
                "GDK_BACKEND, wayland, x11"
                "CLUTTER_BACKEND, wayland"
                "QT_QPA_PLATFORM=wayland;xcb"
                "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
                "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
                "SDL_VIDEODRIVER, x11"
                "MOZ_ENABLE_WAYLAND, 1"
                "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
                "GDK_SCALE,1"
                "QT_SCALE_FACTOR,1"
                "EDITOR,nvim"
            ];
        };


        extraConfig = ''
            monitor=,preferred,auto,auto
            ${extraMonitorSettings}
        '';
            # ${builtins.readFile ../../configs/hyprland.conf}
    };


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
