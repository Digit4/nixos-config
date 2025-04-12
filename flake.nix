{
    description = "A simple flake NixOS config for digit4 PC";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        # TODO Add stylix at some point
        # stylix.url = "github:danth/stylix/release-24.11";

        # adding home manager here
        home-manager.url = "github:nix-community/home-manager/release-24.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        catppuccin-bat = {
            url = "github:catppuccin/bat";
            flake = false;
        };
    };

    outputs = inputs @ {
        self,
        nixpkgs,
        home-manager,
        ...
    }: {
        nixosConfigurations = {
            nixos = let
            username = "digit4";
            specialArgs = { inherit username; };
            in
                nixpkgs.lib.nixosSystem {
                    inherit specialArgs;
                    system = "x86_64-linux";

                    modules = [
                        ./hosts/nixos/default.nix
                        ./users/${username}/nixos.nix
                        # TODO Stylix implementation
                        # inputs.stylix.nixosModules.stylix

                        home-manager.nixosModules.home-manager
                        {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;

                            home-manager.extraSpecialArgs = inputs // specialArgs;
                            home-manager.users.${username} = import ./users/${username}/home.nix;
                        }
                    ];
                };
        };
    };

}

