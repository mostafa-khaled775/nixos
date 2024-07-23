{ ... }: {
  imports = [
    ./programs
    ./window-managers
    ./services
    ./accounts.nix
  ];

  fonts.fontconfig.enable = true;

  home.username = "mostafa";
  home.homeDirectory = "/home/mostafa";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
