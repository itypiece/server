{
  services = {
    earlyoom.enable = true;
    timesyncd.enable = true;
    fstrim.enable = true;
  };
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
}
