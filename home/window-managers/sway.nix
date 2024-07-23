{ pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    config = {
      bars = [ ];
      bindkeysToCode = true;
      gaps = {
        inner = 3;
      };
      menu = "${pkgs.wofi}/bin/wofi --show=drun";
      modifier =  "Mod4";
      terminal = "${pkgs.foot}/bin/foot";
      input = {
        "type:touchpad" = {
          tap = "enabled";
        };
        "type:keyboard" = {
          xkb_layout = "us,eg";
          xkb_options = "ctrl:nocaps,grp:ctrl_space_toggle";
        };
      };
    };
  };
}
