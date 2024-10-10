{
  boot.loader.grub = {
    enable = true;
    devices = [ "/dev/vda" ];
    default = "saved";
  };
}
