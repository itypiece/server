{ username, ... }:
{
  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib"
      "/var/log"
      "/etc/nixos"
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
        ".gnupg"
      ];
    };
  };
}
