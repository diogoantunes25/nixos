/*
  "Server view" of SSH
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
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFlwjNfSabemz2ykeqDTwhgvV3Zw55NXSclZQb5K6Rga dsa@diogo-antunes"
  ];
in
{
  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  users.users.root.openssh.authorizedKeys.keys = sshKeys;
}
