{ pkgs, inputs, ... }:
{
  stylix = {
    enable = true;
    image = "${inputs.wallpapers}/minimalistic/catppuccin_triangle.png";
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
  home-manager.users.mostafa.stylix.targets.helix.enable = false;
  home-manager.users.mostafa.programs.helix.settings.theme = "catppuccin_mocha";
}
