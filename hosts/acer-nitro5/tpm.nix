{ ... }:
{
  boot.initrd.availableKernelModules = [ "tpm_tis" ];
  boot.initrd.systemd.enable = true;
  boot.initrd.systemd.tpm2.enable = true;
  security.tpm2.enable = true;
}
