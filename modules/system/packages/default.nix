{ pkgs, ... }:
{
  imports = [
    ./openssh.nix
    ./matrix.nix
    ./nginx.nix
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
    rocksdb
    tmux
    wget
    matrix-conduit
  ];

  programs.fish.enable = true;
}
