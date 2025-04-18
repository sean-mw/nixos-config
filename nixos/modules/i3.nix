{
  # Enable the ly display manager
  services.displayManager.ly.enable = true;

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable i3
  services.xserver.windowManager.i3.enable = true;

  # Scale display
  services.xserver.dpi = 220;

  # Set Key Repeat Rate
  services.xserver.autoRepeatDelay = 200;
  services.xserver.autoRepeatInterval = 25;
}
