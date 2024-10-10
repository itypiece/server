{ pkgs, }:

{
    services.postgresql = {
        enable = true;
        initialScript = pkgs.writeText "synapse-init.sql" ''
            CREATE ROLE "matrix-synapse" WITH LOGIN PASSWORD 'synapse';
            CREATE DATABASE "matrix-synapse" WITH OWNER "matrix-synapse"
              TEMPLATE template0
              LC_COLLATE = "C"
              LC_CTYPE = "C";
        '';
    };
    services.matrix-synapse = {
        enable = true;
        withJemalloc = true;
        settings = {
            server_name = "matrix.ity.moe";
            public_baseurl = "https://matrix.ity.moe";
            enable_registration = true;
            enable_registration_without_verification = true;
            listeners = [{
                port = 8008;
                bind_addresses = [ "0.0.0.0" ];
                type = "http";
                tls = false;
                x_forwarded = true;
                resources = [{
                    names = [ "client" "federation" ];
                    compress = true;
                }];
            }];
        };
    };
}
