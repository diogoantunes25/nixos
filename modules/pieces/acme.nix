{
  config,
  lib,
  pkgs,
  ...
}:

{
  security.acme = {
    acceptTerms = true;
    defaults.email = "diogo.santiago.pt@gmail.com";
  };
}
