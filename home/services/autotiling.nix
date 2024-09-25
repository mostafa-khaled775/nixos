{ pkgs, ... }:
{
  systemd.user.services.autotiling = {
    Unit = {
      Description = "Script for sway and i3 to automatically switch the horizontal / vertical window split orientation";
      After = [ "sway-session.target" ];
      PartOf = "sway-session.target";
    };
    Service = {
      ExecStart = "${pkgs.autotiling}/bin/autotiling";
    };
    Install = {
      WantedBy = [ "sway-session.target" ];
    };
  };
}
