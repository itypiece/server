{ pkgs, ... }:
{
  imports = [
    ./openssh.nix
  ];
  nixpkgs.config.allowUnfree = true;
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
    screen
    tmux
    wget
  ];

  programs.fish.enable = true;
}
