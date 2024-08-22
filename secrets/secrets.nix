{ inputs, pkgs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = /home/mostafa/.config/sops/age/keys.txt;
      generateKey = true;
    };
    secrets = {
      mostafa_passwd = {
        neededForUsers = true;
      };
      "wireless.env" = {};
    };
  };
  environment.systemPackages = with pkgs; [ age sops ];
}
