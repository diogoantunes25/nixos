{
  config,
  lib,
  pkgs,
  ...
}:

{
	environment.systemPackages = with pkgs; [
      # xorg packages for key remmaping
			xorg.xkbcomp
			xorg.xev

      # remapper for keychron
      via
  ];

  # Modify keybindings
  # FIXME: write script here
	services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xkbcomp}/bin/xkbcomp /home/dsa/layout.xkb $DISPLAY";

  # Configure keymap in X11
	services.xserver = {
		xkb.layout = "us,pt";
		xkb.variant = "";
		# xkb.options = "caps:escape,grp:alt_space_toggle";
	};

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Disable natural scrolling
	services.libinput.touchpad.naturalScrolling = true;
	services.libinput.mouse.naturalScrolling = true;

	# required for keyboard key remapping
	hardware.keyboard.qmk.enable = true;
	services.udev.packages = [ pkgs.via ];
}
