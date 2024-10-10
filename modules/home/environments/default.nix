{ pkgs, ... }:
{
  home.sessionVariables = {
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      pkgs.libsndfile
      pkgs.stdenv.cc.cc
      pkgs.pcsclite
      pkgs.zlib
    ];
    EDITOR = "nvim";
    TERMINAL = "xterm";
    TERM = "screen-256color";
    NIXPKGS_ALLOW_UNFREE = "1";
  };
}
