/**
  Core configuration for any usable NixOS machine
*/

{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
      ./locale.nix
      ./bootloader.nix
  ];

	environment.systemPackages = with pkgs; [
			home-manager
      inputs.agenix.packages."${system}".default
  ];

  # age.identityPaths = builtins.map (u: ${u.home}/.ssh) (builtins.attrValues config.users.users);

  age.identityPaths = [ /home/dsa/.ssh/id_ed25519 ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
