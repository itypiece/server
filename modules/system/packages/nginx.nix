{ lib, pkgs, ... }:
let
    well_known_server = pkgs.writeText "well-known-matrix-server" ''
    {
      "m.server": "matrix.ity.moe"
    }
  '';

  well_known_client = pkgs.writeText "well-known-matrix-client" ''
    {
      "m.homeserver": {
        "base_url": "https://matrix.ity.moe"
      }
    }
  '';
in
{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."matrix.ity.moe" = {
      enableACME = true;
      forceSSL = true;
      listen = [
        {
          addr = "0.0.0.0";
          port = 443;
          ssl = true;
        }
        {
          addr = "[::]";
          port = 443;
          ssl = true;
        }
        {
          addr = "0.0.0.0";
          port = 8448;
          ssl = true;
        }
        {
          addr = "[::]";
          port = 8448;
          ssl = true;
        }
      ];
      locations."/_matrix/" = {
        proxyPass = "http://127.0.0.1:6167";
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_buffering off;
        '';
      };

      extraConfig = ''
        merge_slashes off;
      '';
    };

    virtualHosts."ity.moe" = {
      forceSSL = true;
      enableACME = true;
      locations."=/.well-known/matrix/server" = {
        alias = "${well_known_server}";
        extraConfig = ''
          default_type application/json;
        '';
      };
      locations."=/.well-known/matrix/client" = {
        alias = "${well_known_client}";
        extraConfig = ''
          default_type application/json;

          add_header Access-Control-Allow-Origin "*";
        '';
      };
    };

  };
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "i@ity.moe";
    };
  };
  users.users.nginx.extraGroups = [
    "acme"
  ];
}
