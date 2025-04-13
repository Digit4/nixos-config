{
pkgs,
catppuccin-bat,
...
}: {
    programs = {

        bat = {
            enable = true;
        };

        btop.enable = true;
        jq.enable = true;
        ssh.enable = true;
    };
}
