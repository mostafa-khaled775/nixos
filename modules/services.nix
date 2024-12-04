{ ... }:
{
  services = {
    udev.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    blueman.enable = true;
    printing.enable = true;
    openssh.enable = true;
    dbus.enable = true;
    atd.enable = true;
  };
}
