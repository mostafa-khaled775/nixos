{
  description = "nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    agenix.url = "github:ryantm/agenix";
    stylix.url = "github:danth/stylix";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    inputs@{ self
    , nixpkgs
    , nixpkgs-unstable
    , stylix
    , home-manager
    , disko
    , agenix
    , impermanence
    , pre-commit-hooks
    , ...
    }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      nixosConfigurations.acer-nitro-5 = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          pkgs-unstable = import nixpkgs-unstable { inherit system; };
        };
        modules = [
          agenix.nixosModules.default
          stylix.nixosModules.stylix
          disko.nixosModules.default
          impermanence.nixosModules.impermanence

          ./secrets
          ./modules/hosts.nix
          ./modules/services.nix
          ./modules/system.nix
          ./modules/virtualization.nix
          ./modules/impermanence.nix
          ./hosts/acer-nitro5

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mostafa = import ./home;
            home-manager.extraSpecialArgs = {
              pkgs-unstable = specialArgs.pkgs-unstable;
              userName = "Mostafa Khaled";
            };
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
      checks = forAllSystems (system: {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixpkgs-fmt.enable = true;
          };
        };
      });
      devShells = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.mkShell {
          inherit (self.checks.${system}.pre-commit-check) shellHook;
          buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;
        };
      });
    };
}
