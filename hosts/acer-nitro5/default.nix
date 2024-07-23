{ pkgs, lib, config, ... }: {
  imports = [
    ./services.nix
    ./hardware-configuration.nix
    ./gpu.nix
  ];
  nixpkgs.config.allowUnfreePredicate = pkg:
  builtins.elem (lib.getName pkg)
  (map lib.getName [ pkgs.intel-ocl ]);

  networking = {
    hostName = "mostafa-acer-nitro5";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  users.users.mostafa = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "networkmanager" ];
  };

  programs.light.enable = true;

  swapDevices = [
    { device = "/swap/swap"; size = 16*1024; }
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
    "/" =
      { device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

    "/home" =
      { device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

    "/home/mostafa" =
      { device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [ "subvol=home/mostafa" "compress=zstd" ];
    };

    "/swap" =
      { device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };

    "/nix" =
      { device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

    "/snapshots" =
      { device = "/dev/mapper/nixos-nixos";
      fsType = "btrfs";
      options = [ "subvol=snapshots" "compress=zstd" ];
    };

    "/boot" =
      { device = "/dev/disk/by-uuid/9CDD-97D4";
      fsType = "vfat";
    };
  };
}
