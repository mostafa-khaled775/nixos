{ pkgs, config, ... }:
let
  jsonFormat = pkgs.formats.json { };
  settings = {
    theme = "Gruvbox Dark";
    vim_mode = false;
    telemetry = { metrics = false; diagnostics = false; };
    ui_font_size = config.stylix.fonts.sizes.applications;
      lsp = {
        rust-analyzer.binary.path = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        clangd.binary.path = "${pkgs.clang-tools}/bin/clangd";
        ocamllsp.binary.path = "${pkgs.ocamlPackages.ocaml-lsp}/bin/ocamllsp";
      };
  };
in
{
  home.packages = [ pkgs.zed-editor ];
  xdg.configFile."zed/settings.json" = {
    enable = true;
    source = jsonFormat.generate "zed-user-configuration" settings;
  };
}
