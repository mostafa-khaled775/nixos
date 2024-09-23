{
  description = "nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eriedaberrie-pkgs = {
      url = "github:eriedaberrie/my-nix-packages/1335609c1d3be266c5d1efe9eac5c80bb0260d73";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    sops-nix.url = "github:Mic92/sops-nix";
    stylix.url = "github:danth/stylix";
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      stylix,
      eriedaberrie-pkgs,
      home-manager,
      disko,
      sops-nix,
      impermanence,
      ...
    }:
    {
      nixosConfigurations.acer-nitro-5 = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs eriedaberrie-pkgs;
          pkgs-unstable = import nixpkgs-unstable { inherit system; };
        };
        modules = [
          stylix.nixosModules.stylix
          (
            { ... }:
            {
              nixpkgs.overlays = [ eriedaberrie-pkgs.overlays.default ];
            }
          )
          ./secrets/secrets.nix
          ./modules/hosts.nix
          ./modules/services.nix
          ./modules/system.nix
          ./modules/virtualization.nix
          ./hosts/acer-nitro5

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mostafa = import ./home;
            home-manager.extraSpecialArgs = {
              inherit eriedaberrie-pkgs;
              pkgs-unstable = specialArgs.pkgs-unstable;
              userName = "Mostafa Khaled";
            };
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };
}
