{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:

{
	environment.systemPackages = with pkgs; [
    vim
    pkgs-unstable.neovim

    lua51Packages.lua
    lua51Packages.lua
    lua51Packages.luarocks-nix
  ];

  # environment.variables.EDITOR = "nvim";

  # programs.neovim = {
    # enable = true;
    # defaultEditor = true;
    # vimAlias = false;
    # viAlias = false;
  # };

  # TODO: add home manager config
}
