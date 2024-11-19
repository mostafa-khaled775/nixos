{ }:
{
  programs.zed-editor = {
    enable = true;
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
