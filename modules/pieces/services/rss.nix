{
  config,
  lib,
  pkgs,
  ...
}:
  let virtualHost = "freshrss.dsantunes.com"; in
{
  age.secrets.freshrssPwd = {
    file = ../../../secrets/freshrssPwd.age;
    owner = "freshrss";
    group = "freshrss";
  };

  age.secrets.freshrssDbPwd = {
    file = ../../../secrets/freshrssDbPwd.age;
    owner = "freshrss";
    group = "freshrss";
  };

  services.freshrss = {
    enable = true;
    passwordFile = config.age.secrets.freshrssPwd.path;
    database.passFile = config.age.secrets.freshrssDbPwd.path;
    baseUrl = "https://freshrss.dsantunes.com";
    virtualHost = virtualHost;
    authType = "form";
    user = "freshrss";
  };


  services.nginx = {
    virtualHosts = {
      "${virtualHost}" = {
        forceSSL = true;
        enableACME = true;
      };
    };
  };
}
