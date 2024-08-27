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
  ];
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

  fileSystems = {
    "/" = {
      device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [
        "subvol=root"
        "compress=zstd"
      ];
    };

    "/home" = {
      device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [
        "subvol=home"
        "compress=zstd"
      ];
    };

    "/home/mostafa" = {
      device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [
        "subvol=home/mostafa"
        "compress=zstd"
      ];
    };

    "/swap" = {
      device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [
        "subvol=swap"
        "noatime"
      ];
    };

    "/nix" = {
      device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [
        "subvol=nix"
        "compress=zstd"
        "noatime"
      ];
    };

    "/snapshots" = {
      device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [
        "subvol=snapshots"
        "compress=zstd"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/9CDD-97D4";
      fsType = "vfat";
    };
  };
}
