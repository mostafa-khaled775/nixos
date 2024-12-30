{ pkgs, config, ... }:
{
  specialisation.nvidia-drivers.configuration = {
    system.nixos.tags = [ "nvidia-drivers" ];
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      open = false;
      nvidiaSettings = false;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      prime = {
        sync.enable = true;
        nvidiaBusId = "PCI:01:00:0";
        intelBusId = "PCI:00:02:0";
      };
    };
  };
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    intel-ocl
    intel-vaapi-driver
    vulkan-validation-layers
  ];
}
