{ ... }:
{
  # Moved here from modules/browser.nix: browser choice is a personal
  # preference, not a system-wide necessity, so it lives with the rest of
  # the user's own config (same reasoning as home-modules/brave.nix).
  # Using home-manager's dedicated programs.firefox module means the
  # package and any future profile/settings config live together.
  programs.firefox.enable = true;
}
