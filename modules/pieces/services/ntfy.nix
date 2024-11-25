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
      "ntfy.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        locations = {
          "/".proxyPass = "http://127.0.0.1:7115";
        };
      };
    };
  };

  # FIXME: require nginx (in all services)
  # FIXME: make more modular (don't hardcode the base URL and port)
  services.ntfy-sh = {
    enable = true;
    settings = {
      listen-http = "127.0.0.1:7115";
      base-url = "https://ntfy.dsantunes.com";
    };
  };
}
