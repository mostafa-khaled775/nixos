{ pkgs, ... }:
{
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
        comment = "i3-compatible Wayland compositor.";
        binPath = "${pkgs.sway}/bin/sway";
      };
      niri = {
        prettyName = "Niri";
        comment = "A scrollable-tiling Wayland compositor.";
        binPath = "${pkgs.niri}/bin/niri";
      };
      labwc = {
        prettyName = "Labwc";
        comment = "A Wayland window-stacking compositor.";
        binPath = "${pkgs.labwc}/bin/labwc";
      };
    };
  };
}
