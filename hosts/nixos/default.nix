{inputs, pkgs, lib,config, ...}: {

    imports = [
        ./nvidia.nix
        ./configuration.nix
        ./hardware-configuration.nix

    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable networking
    networking.networkmanager.enable = true;

    networking.hostName = "nixos"; # Define your hostname.
#     networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?
}
