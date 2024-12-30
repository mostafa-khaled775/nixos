{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (pkgs.callPackage ./ayaspell.nix { })
    hunspell
    hunspellDicts.en_US
  ];
}
