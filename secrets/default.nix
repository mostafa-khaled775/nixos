{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    age
    inputs.agenix.packages.${system}.default
  ];
  age.secrets.mostafa-passwd.file = ../secrets/mostafa-passwd.age;
  age.secrets.wireless-env = {
    file = ../secrets/wireless-env.age;
    owner = "root";
    group = "root";
  };
}
