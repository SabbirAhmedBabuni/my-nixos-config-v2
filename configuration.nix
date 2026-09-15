{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/audio.nix
    ./modules/desktop.nix
    ./modules/noctalia.nix
    ./modules/filesystem-support.nix
    ./modules/packages.nix
    ./modules/fonts.nix
    ./modules/power.nix
    ./modules/maintenance.nix
    ./modules/security.nix
    ./modules/impermanence.nix
  ];

  time.timeZone = "Asia/Dhaka";
  i18n.defaultLocale = "en_US.UTF-8";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
