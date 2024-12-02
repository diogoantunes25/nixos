{
  config,
  lib,
  pkgs,
  ...
}:

{
	environment.systemPackages = with pkgs; [
      git
  ];

  # TODO: add home manager config
}
