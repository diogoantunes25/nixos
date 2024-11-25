{
  config,
  lib,
  pkgs,
  ...
}:

{
	environment.systemPackages = with pkgs; [
      # this is huge (~ 5GB), might need to remove if I need more space
      texliveFull
  ];
}
