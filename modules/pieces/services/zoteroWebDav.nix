/**
  Configuration of web dav server to be used by Zotero for syncing files
*/
{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [ webdav ];

  services.webdav = {
    enable = true;
    user = "dsa";
    settings = {
      address = "0.0.0.0";
      port = "8080";
    };
  };
}
