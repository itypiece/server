{ username, ... }:
{
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib"
      "/var/log"
      "/etc/nixos"
      "/etc/ssh"
    ];
    files = [ "/etc/machine-id" ];
    users.alice = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
        "projects"
        ".local"
        ".config"
        ".ssh"
        ".cache"
        ".gnupg"
      ];
    };
  };
}
