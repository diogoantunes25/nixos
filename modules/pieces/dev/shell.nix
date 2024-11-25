{
  config,
  lib,
  pkgs,
  ...
}:

{
	environment.systemPackages = with pkgs; [
			fish
			starship
			tmux
			tmux-xpanes
			neofetch

      # Moving around
			autojump
			tree
			ripgrep
			pdfgrep
			trash-cli
			eza
			fd
			ripgrep

      # Network
			netcat
			nmap
			tcpdump
			iotop
			traceroute
			dig
			curl

      # OS & processes
			lsof
			strace
			ltrace
			htop
			valgrind
			hyperfine

      # Interacting with files
			delta
			scc
			jq
			pup
			file

      # Other
			man-pages
			man-pages-posix
			xclip
			bc
  ];

	programs.fish.enable = true;

  # TODO: add home manager config for fish

  # FIXME: generalize this for all users
  # This used to be at the user config, which doesn't make sense
  users.users.dsa = {
		shell = pkgs.fish;
		useDefaultShell = true;
  };
}
