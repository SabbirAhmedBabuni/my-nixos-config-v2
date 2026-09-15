{ pkgs, ... }:
{
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  programs.xfconf.enable = true;

  environment.systemPackages = [
    pkgs.xfce.exo # fixes Thunar's "Open Terminal Here" (nixpkgs#329688)
  ];

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };
}
