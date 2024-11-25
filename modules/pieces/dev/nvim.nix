{
  config,
  lib,
  pkgs,
  ...
}:

{
	environment.systemPackages = with pkgs; [
    vim
    neovim
  ];

  # TODO: add home manager config
}
