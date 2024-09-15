{ config, pkgs, ... }:

{
  users.users.dsa = {
    isNormalUser = true;
    description = "Diogo Antunes";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
		packages = with pkgs; [
			firefox
			thunderbird
		];
		shell = pkgs.fish;
		useDefaultShell = true;
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
