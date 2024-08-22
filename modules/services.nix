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
    greetd = {
      enable = true;
      settings.default_session.command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
    };
  };
}
