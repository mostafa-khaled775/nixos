{ pkgs, ... }:
{
  programs.chromium = {
    enalbe = true;
    dictionaries = with pkgs; [
      hunspellDictsChromium.en_US
    ];
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "odiekacofiehnpbmihmebnglcopgalfh"; } # idorecall
    ];
    package = pkgs.ungoogled-chromium;
  };
}
