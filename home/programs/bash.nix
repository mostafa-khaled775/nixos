{ pkgs, lib, config, ... }: {
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        cat = "${pkgs.bat}/bin/bat";
        df = "${pkgs.duf}/bin/duf";
        du = "${pkgs.du-dust}/bin/dust";
        ping = "${pkgs.gping}/bin/gping";
      } // lib.optionalAttrs config.programs.zoxide.enable { cd = "z"; };
    };

    direnv.enableBashIntegration = true;
    zoxide.enableBashIntegration = true;
    mcfly.enableBashIntegration = true;
  };
}
