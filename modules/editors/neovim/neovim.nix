{
pkgs,
username,
config,
...
}: {
    programs.neovim = {
        enable = true;
    };

        xdg.configFile.nvim.source = ./nvim;
}
