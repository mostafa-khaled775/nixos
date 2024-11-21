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
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
    config.common.default = "*";
    xdgOpenUsePortal = true;
  };

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];

  system.stateVersion = "24.05";
}
