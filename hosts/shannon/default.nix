{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./hardware.nix
    ../../users/dsa.nix
		];

# Bootloader.
	boot.loader.systemd-boot = {
		enable = true;
		configurationLimit = 10;
	};
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "diogo-antunes"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
		networking.networkmanager.enable = true;

# Set your time zone.
  time.timeZone = "Europe/Lisbon";
	# time.timeZone = "Europe/Berlin";

# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "pt_PT.UTF-8";
		LC_IDENTIFICATION = "pt_PT.UTF-8";
		LC_MEASUREMENT = "pt_PT.UTF-8";
		LC_MONETARY = "pt_PT.UTF-8";
		LC_NAME = "pt_PT.UTF-8";
		LC_NUMERIC = "pt_PT.UTF-8";
		LC_PAPER = "pt_PT.UTF-8";
		LC_TELEPHONE = "pt_PT.UTF-8";
		LC_TIME = "pt_PT.UTF-8";
	};

# Enable cron service
	services.cron = {
		enable = true;
		systemCronJobs = [
		];
	};

# Enable the X11 windowing system.
	services.xserver.enable = true;

# Modify keybindings
	services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xkbcomp}/bin/xkbcomp /home/dsa/layout.xkb $DISPLAY";

# Enable the i3 Desktop Environment.
	services.displayManager.defaultSession = "none+i3";
	services.xserver.desktopManager.xterm.enable = false;
	services.xserver.windowManager.i3.package = pkgs.i3-gaps;
	services.xserver.windowManager.i3 = {
		enable = true;
		extraPackages = with pkgs; [
			dmenu #application launcher most people use
				i3status # gives you the default i3 status bar
				i3lock #default i3 screen locker
		];
	};
	services.xserver.desktopManager.gnome.enable = true;

# Configure keymap in X11
	services.xserver = {
		xkb.layout = "us,pt";
		xkb.variant = "";
		# xkb.options = "caps:escape,grp:alt_space_toggle";
	};

# Enable CUPS to print documents.
	services.printing.enable = true;

# Enable tailscale VPN
	services.tailscale.enable = true;

# Enable hedgedoc (for testing purposes)
  services.hedgedoc = {
    enable = true;
    settings = {
      port = 8001;
      protocolUseSSL = false;
      allowOrigin = [
          "localhost"
      ];
    };
  };

# Enable sound with pipewire.
	sound.enable = true;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
	};

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Disable natural scrolling
	services.libinput.touchpad.naturalScrolling = true;
	services.libinput.mouse.naturalScrolling = true;

# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0" ];

# List packages installed in system profile. To search, run:
# $ nix search wget
	environment.systemPackages = with pkgs; [
		vim
			neovim
			emacs29
			git
			wget
			srm
			zip
			unzip
			alacritty
			polybar
			fish
			starship
			autojump
			i3lock-color
			obsidian
			pass
			gnupg
			pinentry
			zoom-us
			coq
			coqPackages.coqide
			ocaml
			feh

      # Dafny was not working properly
      #(vscode-with-extensions.override {
      #  vscodeExtensions = with vscode-extensions; [
      #      vscodevim.vim
      #      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      #        {
      #          name = "ide-vscode";
      #          publisher = "dafny-lang";
      #          version = "3.3.1";
      #          sha256 = "4oxdgRzUx8p84gvov0nTUTg6yjoCLt4yaZaovDMi+b4=";
      #        }
      #      ];
      #})

      vscode.fhs # HACK
      dafny
			gcc
			gnumake
			libsForQt5.okular # PDF viewer
			google-chrome
			xclip
			tmux
			curl
			scc
			hyperfine
			jq
			pup
			netcat
			nmap
			tcpdump
			man-pages
			man-pages-posix
			gdb
			valgrind
			htop
			iotop
			lsof
			strace
			ltrace
			bc
			file
			traceroute
			dig
			spotify
			tree
# vagrant
# virtualbox
			mpv # video player
			ripgrep
			pdfgrep
			sbcl
			trash-cli
			pulsemixer
			tmux-xpanes
			killall
			openshot-qt
			chez
			ntfy-sh
			imv
			redshift
			neofetch
			networkmanagerapplet
			openconnect
			home-manager
      # docker-compose

			mattermost-desktop
			zotero
			obs-studio
			geogebra
			# mathematica
      discord
      libreoffice-qt
      playerctl

      dotnet-runtime

			xfce.ristretto # image viewer

			(python311.withPackages (ps: [
									 ps.seaborn
									 ps.pandas
									 ps.numpy
									 ps.jupyter
									 ps.pytube
									 ps.virtualenv
									 ps.requests
			]))
			python311Packages.pip
			python311Packages.virtualenv

			nodejs_22
			go
			cargo
			rustc
			rustfmt

# still can't change volume
# alsa-lib
# alsa-utils
# alsa-tools
# alsa-plugins

			brightnessctl
			eza
			fd
			flameshot
			delta
			libnotify
			dunst

# xkb-switch-i3 # toggle keyboard layout

# Compiler development
			flex
			bison
			yasm
			doxygen
			graphviz

# dmenu replacement
			rofi

# xorg packages for key remmaping
			xorg.xkbcomp
			xorg.xev

# via key remapper
			via
			];

	services.libinput.touchpad.disableWhileTyping = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	programs.fish.enable = true;

# Enable Bluetooth
	hardware.bluetooth.enable = true; # enables support for Bluetooth
		hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
		services.blueman.enable = true;

# Enable docker
	virtualisation.docker = {
	  # enable = true;
	  enable = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # https://search.nixos.org/options?channel=24.05&show=systemd.services.%3Cname%3E.postStart&from=0&size=50&sort=relevance&type=packages&query=systemd.services.
  systemd.services.docker.postStart = ''
    echo "HI"
  '';

	# required for keyboard key remapping
	hardware.keyboard.qmk.enable = true;

	services.udev.packages = [ pkgs.via ];

	programs.nix-ld.enable = true; # HACK:

	# services.ntfy-sh.enable = false;

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };


	# systemd.timers.obsidian = {
		# wantedBy = [ "timers.target" ];
		# timerConfig = {
			# OnBootSec = "5m";
			# OnUnitActiveSec = "5m";
			# Unit = "hello-world.service";
		# };
	# };

  # The failure of this service was stopping the rebuild of the systemd, so I disabled it
  systemd.services.NetworkManager-wait-online.enable = false;

	# systemd.services.obsidian = {
		# TODO: Don't really know how to specify what to do

		# script = ''
			# set -eu
			# ${pkgs.coreutils}/bin/bash "Hello World"
			# '';
		# serviceConfig = {
			# Type = "oneshot";
			# User = "dsa";
		# };
	#};

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.11"; # Did you read the comment?

		fonts.packages = with pkgs; [
		noto-fonts
			noto-fonts-cjk
			noto-fonts-emoji
			liberation_ttf
			fira-code
			fira-code-symbols
			mplus-outline-fonts.githubRelease
			dina-font
			proggyfonts
			nerdfonts
		];
}
