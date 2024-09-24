{ pkgs, ... }:
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
    greetd = {
      enable = true;
      settings.default_session.command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
    };
    vaultwarden = {
      enable = true;
      config = {
        ROCKET_ADDRESS = "::1";
        ROCKET_PORT = 8222;
      };
    };
  };
}
