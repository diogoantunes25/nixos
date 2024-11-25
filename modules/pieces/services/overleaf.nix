{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./nginx.nix ];

  services.nginx = {
    virtualHosts = {
      "overleaf.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        locations = {
          "/".proxyPass = "http://127.0.0.1:10000";
        };
      };
    };
  };
}
