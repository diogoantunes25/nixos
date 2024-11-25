{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };
}
