{ ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    config = {
      bars = [ ];
      bindkeysToCode = true;
      gaps = {
        inner = 3;
      };
      modifier = "Mod4";
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
  programs.foot.enable = true;
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main.terminal = "foot";
  };
}
