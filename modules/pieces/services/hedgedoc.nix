{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.hedgedoc = {
    enable = true;
    settings = {
      port = 8001;
      protocolUseSSL = false;
      allowOrigin = [
          "localhost"
      ];
    };
  };

}
