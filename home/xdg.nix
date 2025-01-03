{ pkgs, ... }:
let
  getDesktopFile = pkg: name: "${pkg}/share/applications/${name}.desktop";
in
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "video/*" = getDesktopFile pkgs.mpv "mpv";
      "audio/*" = getDesktopFile pkgs.mpv "mpv";
      "image/*" = getDesktopFile pkgs.imv "imv";
      "text/*" = getDesktopFile pkgs.helix "Helix";
      "text/html" = getDesktopFile pkgs.firefox "firefox.desktop";
      "x-scheme-handler/http" = getDesktopFile pkgs.firefox "firefox.desktop";
      "x-scheme-handler/https" = getDesktopFile pkgs.firefox "firefox.desktop";
      "x-scheme-handler/about" = getDesktopFile pkgs.firefox "firefox.desktop";
      "x-scheme-handler/unknown" = getDesktopFile pkgs.firefox "firefox.desktop";
      "x-scheme-handler/chrome" = getDesktopFile pkgs.firefox "firefox";
      "x-scheme-handler/terminal" = getDesktopFile pkgs.foot "org.codeberg.dnkl.foot";
      "application/pdf" = getDesktopFile pkgs.firefox "firefox";
    };
  };
}
