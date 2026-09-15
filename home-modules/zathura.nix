{ ... }:
{
  # Moved here from modules/packages.nix: using home-manager's dedicated
  # programs.zathura module (instead of a plain package install) means the
  # package and its config live together, and options/settings can be added
  # here later without having to relocate anything.
  programs.zathura = {
    enable = true;
  };
}
