{ pkgs, ... }:
{
  home.packages = [
    pkgs.vesktop
  ];
  home.shellAliases = {
    discord = "vesktop";
  };
}
