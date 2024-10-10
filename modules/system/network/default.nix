{
  networking = {
    hostName = "nixos";
    useDHCP = false;
  };
  services.resolved.enable = false;
  systemd.network.enable = true;

  systemd.network.networks."10-ens3" = {
    matchConfig.Name = "ens3";
    address = [
      "64.23.138.169/24"
      "2604:a880:4:1d0::12d2:5000/64"
    ];
    routes = [
      { Gateway = "2604:a880:4:1d0::1"; }
      {
        Gateway = "64.23.128.1";
        GatewayOnLink = true;
      }
    ];
    linkConfig.RequiredForOnline = "routable";
  };
  networking.nameservers = [
    "8.8.8.8"
  ];
  networking.firewall.allowedTCPPorts = [
    80
    443
    8448
    2222
  ];
  networking.firewall.allowedUDPPorts = [
    80
    443
    8448
  ];
}
