{
  description = "nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eriedaberrie-pkgs = {
      url = "github:eriedaberrie/my-nix-packages/1335609c1d3be266c5d1efe9eac5c80bb0260d73";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{ nixpkgs, nixpkgs-wayland, stylix, eriedaberrie-pkgs, home-manager, ... }: {
    nixosConfigurations.mostafa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs eriedaberrie-pkgs; };
      modules = [
        stylix.nixosModules.stylix
        ({ ... }: {
          config = {
            nix.settings = {
            # add binary caches
            trusted-public-keys = [
              "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
              "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
            ];
            substituters = [
              "https://cache.nixos.org"
              "https://nixpkgs-wayland.cachix.org"
            ];
          };
        };
      })
      ({ ... }: { nixpkgs.overlays = [ eriedaberrie-pkgs.overlays.default nixpkgs-wayland.overlay ]; })
      ./modules/hosts.nix
      ./modules/services.nix
      ./modules/system.nix
      ./hosts/acer-nitro5

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.mostafa = import ./home;
        home-manager.extraSpecialArgs = { inherit eriedaberrie-pkgs; userName = "Mostafa Khaled"; };
        home-manager.backupFileExtension = "backup";
      }
    ];
  };
};
}
