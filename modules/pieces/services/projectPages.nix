/*
  Static projects pages (currently only used for research I'm doing)
*/
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
     "r2s2.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/r2s2.dsantunes.com/";
      };

      "mpc.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/mpc.dsantunes.com/";
      };
    };
  };
}
