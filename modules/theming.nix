{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/images6/Moon-Desktop-Wallpaper.jpg";
      sha256 = "ut6bbnkxIyUEJsM2+YPm3A18hmMD6SpIJQ+tdshT1Sw=";
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      sizes = {
        terminal = 13;
        applications = 13;
        desktop = 11;
        popups = 11;
      };
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font";
      };
    };
  };
  services.displayManager.sddm = {
    extraPackages = [ pkgs.catppuccin-sddm ];
    theme = "catppuccin-mocha";
  };
  home-manager.users.mostafa.stylix.targets.helix = {
    enable = false;
    settings.theme = "catppuccin_mocha";
  };
}
