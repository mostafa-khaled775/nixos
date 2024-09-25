{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  fonts.fontDir.enable = true;
  fonts.enableDefaultPackages = true;

  environment.systemPackages = with pkgs; [
    wget
    git
  ];
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  time.timeZone = "Egypt";

  services.udev.packages = with pkgs; [
    android-udev-rules
    platformio
    platformio-core.udev
    openocd
  ];
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "ctrl:nocaps";
  services.libinput.enable = true;
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = [ pkgs.terminus_font ];
    useXkbConfig = true; # use xkbOptions in tty.
  };

  boot.supportedFilesystems = [
    "ntfs"
    "bcachefs"
  ];
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = "flakes nix-command";
  };
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 7d";

  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
    xdgOpenUsePortal = true;
  };

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];

  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/images6/Moon-Desktop-Wallpaper.jpg";
      sha256 = "ut6bbnkxIyUEJsM2+YPm3A18hmMD6SpIJQ+tdshT1Sw=";
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    fonts = {
      sizes = {
        terminal = 13;
        applications = 13;
        desktop = 11;
        popups = 11;
      };
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
    };
  };

  system.stateVersion = "24.05";
}
