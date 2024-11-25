{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable networking
  networking.networkmanager.enable = true;

	environment.systemPackages = with pkgs; [
			networkmanagerapplet
			openconnect
  ];

  # FIXME: The failure of this service was stopping the rebuild of the systemd, so I disabled it
  systemd.services.NetworkManager-wait-online.enable = false;
}
