{ ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      key_expand = "Tab";
      allow_images = true;
      allow_markup = true;
    };
  };
}
