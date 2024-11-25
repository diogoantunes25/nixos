{
  config,
  lib,
  pkgs,
  ...
}:

{
	virtualisation.docker = {
	  enable = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # TODO: login on start
  # https://search.nixos.org/options?channel=24.05&show=systemd.services.%3Cname%3E.postStart&from=0&size=50&sort=relevance&type=packages&query=systemd.services.
  systemd.services.docker.postStart = ''
    echo "HI"
  '';
}
