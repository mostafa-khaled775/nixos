{ ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    enableHardening = false;
  };
  virtualisation.virtualbox.guest = {
    enable = true;
    clipboard = true;
  };
}
