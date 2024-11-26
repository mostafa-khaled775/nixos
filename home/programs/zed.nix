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
      "go"
    ];
    userKeymaps = { };
    userSettings = {
      vim_mode = false;
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      base_keymap = "Emacs";
      load_direnv = "shell_hook";
    };
  };
}
