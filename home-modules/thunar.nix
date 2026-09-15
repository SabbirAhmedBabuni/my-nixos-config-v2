{ pkgs, ... }:
{
  # nwg-look is a standalone GTK theme-switcher GUI, not referenced by any
  # gtk.* option below, so it needs to be listed explicitly to be installed.
  home.packages = with pkgs; [ nwg-look ];

  # NOTE: gtk.enable and gtk.iconTheme are already set in home-modules/gtk.nix
  # (single source of truth for those), so they're not repeated here.
  # home-manager's gtk module automatically installs whatever package is
  # referenced in gtk.theme.package - no separate home.packages entry needed.
  gtk.theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };
  gtk.gtk3.extraConfig.gtk-application-prefer-dark-theme = true;

  # NOTE: home-manager's xfconf module has no "enable" option -
  # just setting xfconf.settings below is enough to apply it.
  # Only essential/non-negotiable settings are locked here.
  # Everything else (view mode, sort order, sidebar, etc.) is left
  # undeclared on purpose, so it persists from Thunar's own GUI instead.
  xfconf.settings.thunar = {
    "misc-show-thumbnails" = "THUNAR_THUMBNAIL_MODE_ALWAYS";
    "misc-folders-first" = true;
  };
}
