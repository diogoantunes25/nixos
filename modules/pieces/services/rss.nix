{
  config,
  lib,
  pkgs,
  ...
}:
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
    baseUrl = "http://localhost";
    virtualHost = "freshrss";
    authType = "form";
    user = "freshrss";
  };
}
