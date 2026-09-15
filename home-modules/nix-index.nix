{ ... }:
{
  # Uses the pre-built, weekly-updated database from the nix-index-database
  # flake input (see flake.nix) - no need to manually run `nix-index` to
  # build your own database.
  programs.nix-index.enable = true;
  programs.nix-index.enableZshIntegration = true; # command-not-found suggestions in zsh

  # Enables `, <command>` (comma) to try a program once without installing it
  programs.nix-index-database.comma.enable = true;
}
