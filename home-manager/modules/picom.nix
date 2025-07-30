let
  opaqueWindows = [ "rofi" "firefox" ];
in
{
  services.picom = {
    enable = true;
    activeOpacity = 0.95;
    inactiveOpacity = 0.8;
    fade = true;
    opacityRules = map (window: "100:class_g *?= '${window}'") opaqueWindows;
    settings = {
      corner-radius = 0; 
    };
  };
}
