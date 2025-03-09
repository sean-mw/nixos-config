{ pkgs, hostname, stateVersion, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../nixos/modules
    ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  environment.systemPackages = with pkgs; [
    vim
    home-manager
  ];

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.symbols-only
  ];
}
