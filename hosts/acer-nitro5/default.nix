{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./services.nix
    ./hardware-configuration.nix
    ./gpu.nix
    ./disko.nix
  ];
  disko.devices.disk.main.device = "/dev/nvme0n1";

  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) (map lib.getName [ pkgs.intel-ocl ]);

  networking = {
    hostName = "mostafa-acer-nitro5";
    wireless = {
      enable = true;
      environmentFile = config.sops.secrets."wireless.env".path;
      networks = {
        "@home_id@".psk = "@home_psk@";
        "@p10_hotspot_id@".psk = "@p10_hotspot_psk@";
      };
    };
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  users.users.mostafa = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "docker"
    ];
    hashedPasswordFile = config.sops.secrets.mostafa_passwd.path;
  };

  programs.light.enable = true;

  swapDevices = [
    {
      device = "/swap/swap";
      size = 16 * 1024;
    }
  ];

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/nvme0n1p1";
      preLVM = true;
    };
  };
  boot.initrd.availableKernelModules = [
    "aesni_intel"
    "cryptd"
  ];

}
