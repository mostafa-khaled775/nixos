{ pkgs, userName, ... }:
{
  pandoc = {
    defaults = {
      pdf-engine = "tectonic";
      metadata = {
        author = userName;
      };
    };
    enable = true;
    package = pkgs.symlinkJoin {
      name = "pandoc";
      meta.mainProgram = "pandoc";
      paths = with pkgs; [
        pandoc
        tectonic
      ];
    };
  };
}
