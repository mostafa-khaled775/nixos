let
  mostafa-public-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAaZfe/Q374domiYN3YkuxkifqR9sHMvdH4Wk+tOxdXG";
  acer-nitro-5-public-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILtM31Q+dQAAODWs56vz1fEgB4yoLk0EtmMzVLLPdrUz";
in
{
  "mostafa-passwd.age".publicKeys = [
    mostafa-public-key
    acer-nitro-5-public-key
  ];
  "wireless-env.age".publicKeys = [
    mostafa-public-key
    acer-nitro-5-public-key
  ];
}
