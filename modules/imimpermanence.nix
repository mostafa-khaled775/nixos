{ ... }:
{
  environment.persistence."/persistent" = {
    enable = true;
    directories = [
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
    ];
  };
}
