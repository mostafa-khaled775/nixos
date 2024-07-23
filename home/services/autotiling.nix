{ pkgs, ... }: {
  systemd.user.services.autotiling = {
    Unit = {
      Description = "Script for sway and i3 to automatically switch the horizontal / vertical window split orientation";
      Requires = [ "sway-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.autotiling}/bin/autotiling";
    };
  };
}
