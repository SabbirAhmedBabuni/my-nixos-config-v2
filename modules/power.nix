{ ... }:
{
  # boot.resumeDevice is set automatically by disko.nix (swap partition has
  # resumeDevice = true;) - no manual UUID needed.
  powerManagement.enable = true;
  services.logind.settings.Login = {
    HandlePowerKey = "hibernate";
  };
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
