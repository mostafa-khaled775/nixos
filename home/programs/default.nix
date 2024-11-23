{ pkgs, userName, ... }:
{
  imports = [
    ./git.nix
    ./bash.nix
    ./firefox.nix
    ./thunderbird.nix

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
    yt-dlp.enable = true;
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
    tor-browser

    just

    anki
  ];
}
