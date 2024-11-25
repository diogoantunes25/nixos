{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
			rofi
			i3lock-color
			polybar
  ];

  # Enable the i3 Desktop Environment.
	services.xserver.desktopManager.xterm.enable = false;
	services.xserver.desktopManager.gnome.enable = true;

	services.displayManager.defaultSession = "none+i3";

	services.xserver.windowManager.i3.package = pkgs.i3-gaps;
	services.xserver.windowManager.i3 = {
		enable = true;
		extraPackages = with pkgs; [
			  dmenu
				i3status  # default i3 status bar
				i3lock    # default i3 screen locker
		];
	};
}
