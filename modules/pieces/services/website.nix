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
      "dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/blog.dsantunes.com/";
      };
    };
  };
}

