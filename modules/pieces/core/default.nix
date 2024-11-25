/**
  Core configuration for any usable NixOS machine
*/

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
      ./locale.nix
      ./bootloader.nix
  ];

	environment.systemPackages = with pkgs; [
			home-manager
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
