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
      menu = "fuzzel";
      modifier = "Mod4";
      input = {
        "type:touchpad" = {
          tap = "enabled";
        };
        "type:keyboard" = {
          xkb_layout = "us,eg";
          xkb_options = "ctrl:nocaps";
        };
      };
    };
  };
  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "sway";
  };
  programs.foot.enable = true;
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main.terminal = "foot";
  };
}
