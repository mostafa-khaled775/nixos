{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        Locked = true;
      };
      DisableAccounts = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisplayBookmarksToolbar = "newtab";
      UseSystemPrintDialog = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
    };

    profiles.default = {
      name = "default";
      # extensions = common-firefox-addons;
      containersForce = true;
      containers = {
        compilers = {
          color = "blue";
          icon = "circle";
          id = 2;
        };
        cs-courses = {
          id = 3;
        };
        shopping = {
          color = "red";
          icon = "cart";
          id = 5;
        };
      };
      search.force = true;
      search.engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };

        "Nix Options" = {
          urls = [
            {
              template = "https://search.nixos.org/options";
              params = [
                {
                  name = "type";
                  value = "options";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@no" ];
        };

        "NixOS Wiki" = {
          urls = [ { template = "https://wiki.nixos.org/index.php?search={searchTerms}"; } ];
          iconUpdateURL = "https://wiki.nixos.org/favicon.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@nw" ];
        };

        "Arch Wiki" = {
          urls = [ { template = "https://wiki.archlinux.org/?search={searchTerms}"; } ];
          iconUpdateURL = "https://wiki.nixos.org/favicon.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@aw" ];
        };

        "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
      };
      settings = {
        "browser.newtabpage.pinned" = [
          {
            title = "Github";
            url = "https://github.com";
          }
          {
            title = "Gmail";
            url = "https://mail.google.com";
          }
          {
            title = "NixOS";
            url = "https://nixos.org";
          }
          {
            title = "Youtube";
            url = "https://youtube.com";
          }
        ];
      };
    };
  };
}
