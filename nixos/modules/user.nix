{ pkgs, user, ... }:

{
  programs.zsh.enable = true;

  virtualisation.docker.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
  };

  services.getty.autologinUser = user;
}
