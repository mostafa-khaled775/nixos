{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.sway ];
  programs.sway.enable = true;
  services.displayManager.defaultSession = "sway";
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };
}
