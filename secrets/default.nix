{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    age
    inputs.agenix.packages.${system}.default
  ];
  age.secrets.mostafa-passwd.file = ../secrets/mostafa-passwd.age;
  age.secrets.wireless-secrets = {
    file = ../secrets/wireless-secrets.age;
    owner = "root";
    group = "root";
  };
}
