{ pkgs, ... }:

{
  # Larger cursor
  home.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
  };
}
