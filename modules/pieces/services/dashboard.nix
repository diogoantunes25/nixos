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
      "board.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/board.dsantunes.com/";
      };
    };
  };

  # Turned off because it caused problems when getting golang dependencies from Google
  networking.enableIPv6 = false;
}
