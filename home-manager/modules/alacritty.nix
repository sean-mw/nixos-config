{ hostname, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;
      font = {
        size = if hostname == "macbook-air-m3" then 32 else 16;
      };
    };
  };
}
