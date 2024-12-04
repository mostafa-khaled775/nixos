{ ... }:
{
  programs.sway.enable = true;
  services.xserver.displayManager.gdm = {
    wayland = true;
    enable = true;
  };
  services.displayManager.defaultSession = "sway-uwsm";
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      sway = {
        prettyName = "Sway";
        comment = "Sway compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/sway";
      };
    };
  };
}
