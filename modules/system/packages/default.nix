{ pkgs, ... }:
{
  imports = [
    ./openssh.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    killall
    zip
    unzip
    gcc
    fish
    git
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.numpy
    ]))
    ffmpeg
    wget
  ];

  programs.fish.enable = true;
}
