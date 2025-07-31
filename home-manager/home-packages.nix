{ pkgs, ... }: 

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    firefox
    feh
    unzip
    xclip
    flameshot
  ];
}
