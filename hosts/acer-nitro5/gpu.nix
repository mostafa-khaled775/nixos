{ pkgs, ... }:
{
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.extraPackages = with pkgs; [
    intel-media-driver
    intel-ocl
    intel-vaapi-driver
    vulkan-validation-layers
  ];
}
