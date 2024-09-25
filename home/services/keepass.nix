{ pkgs, ... }:
{
  systemd.user.services.keepass = {
    Unit = {
      Description = "KeePassXC is a cross-platform community-driven port of the Windows application “Keepass Password Safe”.";
      Documentation = "https://keepassxc.org/docs/";
      After = [ "graphical-session.target" ];
      PartOf = "graphical-session.target";
    };
    Service = {
      ExecStart = "${pkgs.keepassxc}/bin/keepassxc";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
