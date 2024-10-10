{
  services.caddy = {
    enable = true;
    virtualHosts."bot.ity.moe".extraConfig = ''
      reverse_proxy http://127.0.0.1:5140
    '';
  };
}
