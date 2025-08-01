{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 48;
    gtk.enable = true;
  };
}
