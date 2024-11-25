{
  self,
  config,
  lib,
  pkgs,
  ...
}:
{
	imports = [
    ./hardware.nix
    ../../modules/users/dsa.nix
    ../../modules/profiles/laptop.nix

    ../../modules/pieces/graphical/programs
	];

	boot.loader.systemd-boot = {
		enable = true;
		configurationLimit = 10;
	};

	networking.hostName = "shannon";

  time.timeZone = "Europe/Lisbon";
	# time.timeZone = "Europe/Berlin";

	environment.systemPackages = with pkgs; [
    # FIXME: modularize this into something
    pass
    gnupg
    pinentry

    ntfy-sh

    # FIXME: modularize this into something
    libnotify
    dunst
  ];

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.11"; # Did you read the comment?
}
