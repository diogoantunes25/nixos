{
  config,
  lib,
  pkgs,
  ...
}:

{
	environment.systemPackages = with pkgs; [
		emacs29
  ];

  # TODO: add home manager config
}
