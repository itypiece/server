{
  pkgs,
  ...
}:
{

  users.users.alice = {
    shell = pkgs.fish;
    hashedPassword = "$y$j9T$fjdzseDLOYmIoRDv5gC40/$tti4jiCiT2Rt482m12rDg3BFioHPDtSGjBQJ0YgZVT7";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKDSVZxylfKdsb1FqxVz9WoVNOpsleB3oHvlCbM7PFH5 alice@nixos"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIlP+4E4+4iM3Eyi85KdyAXwGpT+XlT1lMGNqD4/UAQc rikki@ASUSTianXuan4-NixOS"
    ];
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
  };
}
