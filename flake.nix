{
  description = "nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # impermanence.url = "github:nix-community/impermanence";
    agenix.url = "github:ryantm/agenix";
    stylix.url = "github:danth/stylix";
    wallpapers = {
      url = "github:dxnst/nord-backgrounds";
      flake = false;
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      chaotic,
      stylix,
      home-manager,
      disko,
      agenix,
      # impermanence,
      pre-commit-hooks,
      treefmt-nix,
      systems,
      lanzaboote,
      ...
    }:
    let
      # Small tool to iterate over each systems
      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});
      # Eval the treefmt modules from ./treefmt.nix
      treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./treefmt.nix);
    in
    {
      nixosConfigurations.acer-nitro-5 = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          agenix.nixosModules.default
          stylix.nixosModules.stylix
          disko.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
          chaotic.nixosModules.default
          # impermanence.nixosModules.impermanence

          ./secrets
          ./modules/sddm.nix
          ./modules/uwsm.nix
          ./modules/hosts.nix
          ./modules/services.nix
          ./modules/system.nix
          ./modules/virtualization.nix
          ./modules/impermanence.nix
          ./modules/registry.nix
          ./modules/v4l2loopback.nix
          ./modules/theming.nix
          ./modules/unfree.nix
          ./hosts/acer-nitro5

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mostafa = import ./home;
            home-manager.extraSpecialArgs = {
              userName = "Mostafa Khaled";
            };
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);
      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
        pre-commit-check = pre-commit-hooks.lib.${pkgs.system}.run {
          src = ./.;
          hooks = {
            treefmt.enable = true;
            treefmt.package = treefmtEval.${pkgs.system}.config.build.wrapper;
            deadnix.enable = true;
          };
        };
      });
      devShells = eachSystem (pkgs: {
        default = nixpkgs.legacyPackages.${pkgs.system}.mkShell {
          inherit (self.checks.${pkgs.system}.pre-commit-check) shellHook;
          buildInputs = self.checks.${pkgs.system}.pre-commit-check.enabledPackages;
        };
      });
    };
}
