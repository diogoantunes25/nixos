/**
  Basic functionality for a laptop
*/

{
  self,
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../pieces/core

    ../pieces/bluetooth.nix
    ../pieces/dev
    ../pieces/docker.nix
    ../pieces/flatpak.nix
    ../pieces/fonts.nix
    ../pieces/graphical/i3.nix
    ../pieces/graphical/screen.nix
    ../pieces/graphical/x11.nix
    ../pieces/keyboard.nix
    ../pieces/network
    ../pieces/sound
    ../pieces/ssh.nix
    ../pieces/tailscale.nix
  ];

	programs.nix-ld.enable = true; # HACK:
}
