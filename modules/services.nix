{ pkgs, ... }: {
  services = {
    udev = {
      enable = true;
      packages = with pkgs; [
        android-udev-rules
      ];
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    blueman.enable = true;
    printing.enable = true;
    openssh.enable = true;
    dbus.enable = true;
    displayManager.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    displayManager.sddm.extraPackages = [ pkgs.neatvnc ];
    displayManager.sddm.wayland.compositor = "kwin";
  };
}
