{ pkgs, ... }: {
  systemd.user.services.keepass = {
    Unit = {
      Description = "KeePassXC is a cross-platform community-driven port of the Windows application “Keepass Password Safe”.";
      Requires = "graphical-session.target";
    };
    Service = {
      ExecStart = "${pkgs.keepassxc}/bin/keepassxc";
    };
  };
}
