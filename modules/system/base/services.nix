{
  services = {
    timesyncd.enable = true;
  };
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
}
