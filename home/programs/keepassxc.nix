{ pkgs, ... }:
let
  iniFormat = pkgs.formats.ini { };
in {
  home.packages = [
    pkgs.keepassxc
  ];

  xdg.configFile."keepassxc/keepassxc.ini" = {
    enable = true;
    source = iniFormat.generate "keepassxc-configurations" {
      General = {
        ConfigVersion = 2;
        MinimizeAfterUnlock = true;
        MinimizeOnOpenUrl = true;
      };
      Browser.CustomProxyLocation = "";
      Browser.Enabled = true;
      FdoSecrets.Enabled = true;
      GUI = {
        ApplicationTheme = "classic";
        CompactMode = true;
        MinimizeOnClose = true;
        MinimizeOnStartup = true;
        MonospaceNotes = true;
        ShowTrayIcon = true;
        TrayIconAppearance = "colorful";
      };
      PasswordGenerator = {
        AdditionalChars = "";
        AdvancedMode = true;
        Braces = false;
        Dashes = true;
        EASCII = true;
        ExcludedChars = "";
        Length = 32;
        Logograms = true;
        Math = true;
        Punctuation = true;
        Quotes = false;
      };
      Security.LockDatabaseIdle = true;
    };
  };
}
