{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        line-number = "relative";
        cursorline = true;
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
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
      language =
        let
          lang = name: formatter-command: {
            name = name;
            formatter = {
              command = formatter-command;
            };
            auto-format = true;
            indent = {
              tab-width = 2;
              unit = "  ";
            };
          };
        in
        [
          (lang "rust" "rustfmt")
          (lang "c" "clang-format")
          (lang "cpp" "clang-format")
          (lang "yaml" "yamlfmt")
          (lang "bash" "shfmt")
          (lang "nix" "nixfmt")
          (lang "python" "black")
        ];
      language-server = {
        rust-analyzer.command = "rust-analyzer";
        clangd.command = "clangd";
        cmake-language-server.command = "cmake-language-server";
        qmlls.command = "qmlls";
        bash-language-server.command = "bash-language-server";
        dot-language-server.command = "dot-language-server";
        pylsp.command = "pylsp";
        nil.command = "nil";
        yaml-language-server.command = "yaml-language-server";
        docker-langserver.command = "docker-langserver";
      };
    };
    extraPackages = with pkgs; [
      dockerfile-language-server-nodejs
      # c-family and related stuff
      clang-tools
      lldb
      cmake-language-server
      kdePackages.qtdeclarative

      # rust
      rust-analyzer
      rustfmt

      # nix
      nil
      nixfmt-rfc-style

      # shell
      nodePackages_latest.bash-language-server
      shellcheck
      shfmt

      # yaml
      yaml-language-server
      yamlfmt

      dot-language-server

      # python 
      python312Packages.python-lsp-server
      python312Packages.rope
      python312Packages.pyflakes
      python312Packages.pycodestyle
      black
    ];
  };
}
