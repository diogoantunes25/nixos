{
  config,
  lib,
  pkgs,
  ...
}:

{
  # STATE: Run `tailscale up` on first boot.
  services.tailscale = {
    enable = true;
  };
}
