/**
  Bare minimum for programming / software development
  Separated in different files in case only a specific tool is required / is required
  only temporarily, but might be needed again later.
*/

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
      ./nvim.nix
      ./emacs.nix
      ./languages.nix
      ./shell.nix
  ];

  # FIXME:
	environment.systemPackages = with pkgs; [
			git
			wget
			srm
			zip
			unzip
			alacritty
  ];
}
