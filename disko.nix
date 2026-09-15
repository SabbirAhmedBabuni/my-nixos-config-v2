{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            size = "1M";
            type = "EF02"; # BIOS boot partition (Legacy BIOS + GPT)
            priority = 1;
          };
          swap = {
            size = "8G";
            priority = 2;
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true; # sets boot.resumeDevice automatically for hibernate
            };
          };
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" "-L" "nixos-main" ];
              subvolumes = {
                "/root" = { mountpoint = "/"; mountOptions = [ "subvol=root" "compress=zstd" "noatime" ]; };
                "/home" = { mountpoint = "/home"; mountOptions = [ "subvol=home" "compress=zstd" "noatime" ]; };
                "/nix" = { mountpoint = "/nix"; mountOptions = [ "subvol=nix" "compress=zstd" "noatime" ]; };
                "/persist" = { mountpoint = "/persist"; mountOptions = [ "subvol=persist" "compress=zstd" "noatime" ]; };
                "/log" = { mountpoint = "/var/log"; mountOptions = [ "subvol=log" "compress=zstd" "noatime" ]; };
                # "blank" subvolume created manually right after disko runs, see README.md
              };
            };
          };
        };
      };
    };
  };

  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;
}
