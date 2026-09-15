{ config, pkgs, inputs, ... }:
{
  imports = [
    ./home-modules/git.nix
    ./home-modules/zsh.nix
    ./home-modules/niri.nix
    ./home-modules/neovim.nix
    ./home-modules/kitty.nix
    ./home-modules/gtk.nix
    ./home-modules/swayidle.nix
    ./home-modules/bat.nix
    ./home-modules/eza.nix
    ./home-modules/fzf.nix
    ./home-modules/starship.nix
    ./home-modules/zoxide.nix
    ./home-modules/direnv.nix
    ./home-modules/thunar.nix
    ./home-modules/brave.nix
    ./home-modules/firefox.nix
    ./home-modules/zathura.nix
    ./home-modules/nix-index.nix
  ];

  home.username = "shabbir";
  home.homeDirectory = "/home/shabbir";
  home.stateVersion = "26.05";
}
