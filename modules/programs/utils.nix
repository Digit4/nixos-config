{
pkgs,
config,
...
}: {
    # NOTE Packages that should be installed to the user profile should go under this section
    home.packages = with pkgs; [
        neofetch
        # cli file manager
        nnn

        stow

        # archive
        zip
        unzip
        xz
        p7zip

        # utils
        ripgrep
        jq    # to filter json data
        fzf    # fuzzy finder


        # misc
        cowsay
        file
        which
        tree
        gnused
        gnutar
        gawk
        zstd
        gnupg


        # nix related
        nix-output-monitor


        # productivity
        glow    # markdown preview in terminal

        btop    # htop equivalent
        iotop    # io monitoring
        iftop    # network monitoring

        # system call monitoring
        strace
        ltrace
        lsof

        # system tools
        sysstat
        lm_sensors # for `sensors` command
        ethtool
        pciutils    # lspci
        usbutils    # lsusb
    ];
}
