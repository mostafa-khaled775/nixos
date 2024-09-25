{ ... }:
{
  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;
  environment.persistence."/persist" = {
    enable = true;
    directories = [
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
    ];
    users.mostafa = {
      directories = [
        {
          directory = ".ssh";
          mode = "0700";
        }
        "Downloads"
        "Videos"
        "Pictures"
        "Documents"
      ];
    };
  };
}
