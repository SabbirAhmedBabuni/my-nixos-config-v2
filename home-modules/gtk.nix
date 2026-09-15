{ pkgs, ... }:
{
  gtk.enable = true;

  gtk.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };

  gtk.cursorTheme = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  gtk.font = {
    name = "Inter";
    size = 11;
  };
}
