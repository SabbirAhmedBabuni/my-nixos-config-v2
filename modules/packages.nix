{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # git is NOT listed here - home-modules/git.nix's programs.git.enable
    # already installs it for the user.
    ntfs3g
    yazi
    poppler-utils
    imagemagick
    qimgv
    ffmpegthumbnailer
    mpv
    satty
    mousepad
    unzip
    zip
    p7zip
    unrar
    fastfetch
    ddcutil
    btrfs-progs # for manual use after boot; separate from impermanence.nix's initrd-scoped btrfs-progs
    btop
    nh
    # nix-index/comma are set up via nix-index-database in home-modules/nix-index.nix instead
  ];

  users.users.shabbir = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}
