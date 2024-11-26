{ pkgs, ... }:
{
  home.packages = [
    pkgs.legcord
  ];
  home.shellAliases = {
    discord = "legcord";
  };
}
