{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = (
      pkgs.emacsWithPackagesFromUsePackage {
        package = pkgs.emacs30-pgtk;
        alwaysTangle = true;
        alwaysEnsure = true;
        defaultInitFile = true;
        config = ./emacs-config.org;
        extraEmacsPackages =
          epkgs: with epkgs; [
            treesit-grammars.with-all-grammars
            pkgs.ripgrep
            pkgs.git

            pkgs.gh

            # lean4
            pkgs.lean4
            pkgs.elan

            # nix lsp
            pkgs.nixd

            # rust language
            pkgs.rust-analyzer
            pkgs.cargo
            pkgs.rustc
            pkgs.rustfmt

            # latex
            pkgs.texlab
            pkgs.tectonic
            pkgs.texliveFull
          ];
      }
    );
  };
}
