{ config, pkgs, ... }:

{
  users.users.dsa = {
    isNormalUser = true;
    home  = "/home/dsa";
    description = "Diogo Antunes";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    openssh.authorizedKeys.keys = [
      # TODO: add my ssh keys
    ];
  };

  home-manager = {
    users.dsa = {
      home.stateVersion = "24.05";
    };
  };
}
