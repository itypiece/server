{ pkgs, ... }:

{
  services.matrix-conduit = {
    enable = true;
    settings.global = {
      allow_registration = true;
      server_name = "matrix.ity.moe";
#      database_backend = "rocksdb";
      trusted_servers = [
        "matrix.org"
        "matrix.envs.net"
      ];
      turn_uris = [
        "turn:staticauth.openrelay.metered.ca:80?transport=udp"
        "turn:staticauth.openrelay.metered.ca:80?transport=tcp"
      ];
      turn_secret = "openrelayprojectsecret";
    };
  };
}
