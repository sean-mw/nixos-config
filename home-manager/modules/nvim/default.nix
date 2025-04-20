{ pkgs, ... }: 

{
  home.file = {
    ".config/nvim".source = ./nvim;
  };

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gnumake
      gcc
      ripgrep
      lua-language-server
      nil
      nixd
    ];
  };
}
