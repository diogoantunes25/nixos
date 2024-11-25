{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./pipewire.nix ];

  environment.systemPackages = with pkgs; [
      playerctl
			pulsemixer
  ];
}
