{ config, lib, pkgs, ... }:
{
  boot.initrd.systemd.enable = true;

  boot.initrd.systemd.services.rollback-root = {
    description = "Rollback btrfs root subvolume to a pristine state";
    wantedBy = [ "initrd.target" ];
    before = [ "sysroot.mount" ];
    unitConfig.DefaultDependencies = "no";
    serviceConfig.Type = "oneshot";
    path = [ pkgs.btrfs-progs ];
    script = ''
      mkdir -p /mnt
      mount -o subvol=/ /dev/disk/by-label/nixos-main /mnt
      btrfs subvolume delete /mnt/root
      btrfs subvolume snapshot /mnt/blank /mnt/root
      umount /mnt
    '';
  };

  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/etc/NetworkManager/system-connections"
      "/var/cache/tuigreet" # tuigreet's --remember/--remember-session cache, confirmed via upstream README
      "/var/lib/systemd"
      "/etc/ssh"
      # /var/log NOT listed - it's its own dedicated persistent subvolume already
    ];
    files = [
      "/etc/machine-id"
      "/etc/adjtime"
    ];
  };
}
