{ pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    # ensures that sddm is using qt6
    package = pkgs.kdePackages.sddm;
  };
}
