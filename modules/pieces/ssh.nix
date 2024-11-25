/**
  "Client view" of SSH
*/

{
  config,
  lib,
  pkgs,
  ...
}:

let
  # Keys authorized for ssh as root
  sshKeys = [
      # FIXME:
  ];
in
{
  /*
   FIXME:
  programs.ssh.extraConfig = {
    builtins.readFile "../../../dotfiles/ssh/config";
  };
  */
}
