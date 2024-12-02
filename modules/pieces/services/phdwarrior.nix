{
  config,
  lib,
  pkgs,
  phdw,
  ...
}:

{
  imports = [ phdw.nixosModules.phdw-server ];
}
