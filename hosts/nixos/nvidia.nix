{config, pkgs, ...}: {
    # Enable OpenGL
    hardware.graphics = {
        enable = true;
    };

    # Load nvidia drivers for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
        # Modesetting is required
        modesetting.enable = true;

        # Nvidia Power management. I'd rather not use it.
        powerManagement.enable = false;

        # finegrained power management. No pls...
        powerManagement.finegrained = false;

        # Use the open source kernel module (not nouveau the open source driver)
        open = true;

        # Enable nvidia settings menu. Sure i guess...
        nvidiaSettings = true;

        # select the appropriate driver version for my card. 3060 so it'll be stable.
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
}
