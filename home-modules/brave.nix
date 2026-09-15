{ pkgs, ... }:
{
  # Moved here from modules/packages.nix: browser choice is a personal
  # preference, not a system-wide necessity, so it lives with the rest of
  # the user's own config. No home-manager `programs.brave` module exists
  # yet, so this is just a plain package install for now.
  home.packages = [ pkgs.brave ];
}
