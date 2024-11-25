{
  config,
  lib,
  pkgs,
  ...
}:

{
	environment.systemPackages = with pkgs; [
			killall
  ];

  # Enable the X11 windowing system.
	services.xserver.enable = true;

}
