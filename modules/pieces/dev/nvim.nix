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
    clang-tools

    bear
  ];

  # TODO: add home manager config
}
