{
  home.file = {
    ".config/rofi/theme.rasi".source = ./theme.rasi;
  };

  programs.rofi = {
    enable = true;
    theme = ".config/rofi/theme.rasi";
    extraConfig = {
      dpi = 220;
    };
  };
}
