{ pkgs, ... }:
{
  imports = [
    # cli
    ./git.nix
    ./bash.nix
    ./pandoc.nix

    # desktop
    ./firefox.nix
    ./thunderbird.nix
    ./discord.nix
    ./zulip.nix
    ./ente-auth.nix

    # editors
    ./zed.nix
    ./helix.nix
    ./emacs.nix

    # spell checking
    ./spell.nix
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
