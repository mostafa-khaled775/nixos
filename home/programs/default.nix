{ pkgs, userName, ... }: {
  imports = [
    ./keepassxc.nix
    ./git.nix
    ./bash.nix
    ./firefox.nix
    ./wofi.nix

    # web
    ./freetube.nix

    # editors
    ./zed.nix
    ./helix.nix
  ];

  programs = {
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
    foot.enable = true;
  };

  home.packages = with pkgs; [
    fd tokei
    yq-go jq
    unzip p7zip ouch zip
    tree
    wl-clipboard
  ];
}
