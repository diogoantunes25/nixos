{
  config,
  lib,
  pkgs,
  ...
}:

{
	environment.systemPackages = with pkgs; [
      obsidian
  ];

  # FIXME: add cronjob for regular commit
}
