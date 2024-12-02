/**
  Basic functionality for a server
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

    ../pieces/acme.nix
    ../pieces/dev/shell.nix
    ../pieces/dev/nvim.nix
    ../pieces/dev/git.nix
    ../pieces/docker.nix
    ../pieces/fail2ban.nix
    ../pieces/ssh.nix
    ../pieces/network
    ../pieces/services/ssh.nix # all servers will have ssh
    ../pieces/tailscale.nix
  ];

	# This value determines the NixOS release from which the default
}
