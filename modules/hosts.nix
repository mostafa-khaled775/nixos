{ pkgs, ... }:
let
  stevenBlackHosts = pkgs.fetchFromGitHub {
    owner = "StevenBlack";
    repo = "hosts";
    rev = "3.14.41";
    hash = "sha256-3HUeHdEFtZV/I7mRKhpYJ183JbGohQxhgP725vp4PHA=";
  };
in
{
  networking.extraHosts = ''
    ${builtins.readFile (stevenBlackHosts + "/alternates/gambling-porn/hosts")}
  '';
}
