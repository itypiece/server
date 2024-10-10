{ pkgs, ... }:
{
  documentation = {
    enable = false;
    doc.enable = false;
    nixos.enable = false;
    man.enable = false;
    dev.enable = false;
  };

  users.mutableUsers = false;

  system.stateVersion = "24.11";
}
