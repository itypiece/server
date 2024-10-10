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
  programs.command-not-found.enable = false;
  system.stateVersion = "24.11";

}
