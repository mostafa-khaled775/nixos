{ inputs, pkgs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = /var/lib/sops-nix/key.txt;
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
