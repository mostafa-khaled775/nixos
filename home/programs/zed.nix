{
  pkgs,
  lib,
  config,
  ...
}:
let
  jsonFormat = pkgs.formats.json { };
  extraPackages = with pkgs; [
    rust-analyzer
    cargo
    rustc
    clang-tools
    nixd
    pyright
    taplo
  ];
  settings = {
    theme = "Gruvbox Dark";
    vim_mode = false;
    telemetry = {
      metrics = false;
      diagnostics = false;
    };
    ui_font_size = config.stylix.fonts.sizes.applications;
  };
in
{
  home.packages = [
    (pkgs.symlinkJoin {
      name = "zed-wrapped-${lib.getVersion pkgs.zed-editor}";
      paths = [ pkgs.zed-editor ] ++ extraPackages;
    })
  ];
  xdg.configFile."zed/settings.json" = {
    enable = true;
    source = jsonFormat.generate "zed-user-configuration" settings;
  };
}
