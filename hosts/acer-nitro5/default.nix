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
    # ./impermanence.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) (map lib.getName [ pkgs.intel-ocl ]);

  networking = {
    hostName = "mostafa-acer-nitro5";
    wireless = {
      enable = true;
      environmentFile = config.age.secrets.wireless-env.path;
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
    hashedPasswordFile = config.age.secrets.mostafa-passwd.path;
  };

  programs.light.enable = true;

  boot.initrd.availableKernelModules = [
    "aesni_intel"
    "cryptd"
  ];

}
