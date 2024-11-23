{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor_git;
    extensions = [
      "html"
      "toml"
      "nix"
      "latex"
      "xy-zed"
      "sql"
      "slint"
      "rst"
      "make"
      "graphviz"
    ];
    userKeymaps = { };
    userSettings = {
      vim_mode = false;
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
    };
  };
}
