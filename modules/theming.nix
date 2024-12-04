{
  pkgs,
  inputs,
  config,
  ...
}:
{
  stylix = {
    enable = true;
    image = "${inputs.wallpapers}/operating-systems/1920x1080/nixos.png";
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
    theme = "${pkgs.catppuccin-sddm}/share/sddm/themes/catppuccin-mocha";
  };
  home-manager.users.mostafa = {
    stylix.targets.helix.enable = false;
    programs.helix.settings.theme = "catppuccin_mocha";
    programs.zed-editor = {
      extensions = [
        "catppuccin"
      ];
      userSettings = {
        theme = {
          mode = "dark";
          dark = "Catppuccin Mocha";
        };
        ui_font_family = config.stylix.fonts.sansSerif.name;
        ui_font_size = config.stylix.fonts.sizes.applications;
        buffer_font_family = config.stylix.fonts.monospace.name;
        buffer_font_size = config.stylix.fonts.sizes.terminal;
      };
    };
  };

}
