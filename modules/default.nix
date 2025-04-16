{
    pkgs,
    ...
}:{
    imports = [
        ./scripts
        ./stylix.nix
    ];

    home.packages = with pkgs; [
        firefox
        neovim
        vscode

        hyprland
        hypridle
        hyprlock
        waybar

        bat
        btop
        jq

        starship
        zsh

        neofetch
        fastfetch
        nnn
        yazi
        stow

        zip
        unzip
        xz
        p7zip

        ripgrep
        jq
        fzf

        cowsay
        wl-clipboard
        file
        which
        tree
        gnused
        gnutar
        gawk
        zstd
        gnupg

        glow
        btop
        iotop
        iftop

        strace
        ltrace
        lsof

        sysstat
        lm_sensors
        ethtool
        pciutils
        usbutils

        kitty
        alacritty
        rofi
        lazygit

        keychain

        tmux

        sway
    ];
}
