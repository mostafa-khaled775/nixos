{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
      keys.insert = {
        j.k = "normal_mode";
        C-p = "move_line_up";
        C-n = "move_line_down";
        C-e = "goto_line_end_newline";
        C-a = "goto_line_start";
        C-f = "move_char_right";
        C-b = "move_char_left";
      };
    };
    languages = {
      language-server = {
        rust-analyzer.command = "rust-analyzer";
        clangd.command = "clangd";
        bash-language-server.command = "bash-language-server";
        dot-language-server.command = "dot-language-server";
        pylsp.command = "pylsp";
      };
    };
    extraPackages = with pkgs; [
      clang-tools
      rust-analyzer
      nixd
      nodePackages_latest.bash-language-server
      yaml-language-server
      dot-language-server
      lua-language-server
      jq-lsp
      python312Packages.python-lsp-server
    ];
  };
}
