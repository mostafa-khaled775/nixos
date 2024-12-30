{
  pkgs,
  config,
  lib,
  ...
}:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) (
      map lib.getName [
        pkgs.intel-ocl
        config.hardware.nvidia.package
      ]
    );
}
