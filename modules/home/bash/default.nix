{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      PS1='\[\e[0;32m\]\u\[\e[m\]@\[\e[0;37m\]\h\[\e[m\] \[\e[0;32m\]\w\[\e[m\]> '
    '';
    shellAliases = {
      "clean" = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system && sudo nix store gc --debug";
      "build" = "sudo nixos-rebuild switch --flake /etc/nixos/server/.#alice";
    };
    shellOptions = [ "extglob" ];
  };
}
