{ lib, ... }:
{
  disko.devices = {
    nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [
          "relatime"
          "mode=755"
        ];
      };
    };
    disk.main = {
      device = "/dev/vda";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            name = "boot";
            size = "1M";
            type = "EF02";
            priority = 0;
          };
          ESP = {
            name = "ESP";
            size = "500M";
            type = "EF00";
            priority = 1;
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "fmask=0077" "dmask=0077" ];
            };
          };
          nix = {
            name = "nix";
            size = "100%";
            content = {
              type = "filesystem";
              format = "btrfs";
              mountpoint = "/nix";
            };
          };
        };
      };
    };
  };
}
