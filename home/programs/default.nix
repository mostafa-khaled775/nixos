{ pkgs, userName, ... }:
{
  imports = [
    ./keepassxc.nix
    ./git.nix
    ./bash.nix
    ./firefox.nix

    # web
    ./freetube.nix

    # editors
    ./zed.nix
    ./helix.nix
  ];

  programs = {
    mpv.enable = true;
    imv.enable = true;
    direnv.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    bat.enable = true;
    lsd.enable = true;
    lsd.enableAliases = true;
    pandoc = {
      defaults = {
        metadata = {
          author = userName;
        };
      };
      enable = true;
    };
    mcfly.enable = true;
    bottom.enable = true;
  };

  home.packages = with pkgs; [
    fd
    tokei
    yq-go
    jq
    file
    unzip
    p7zip
    zip
    tree
    wl-clipboard
    act
    tor-browser

    pomodoro-gtk
  ];
}
