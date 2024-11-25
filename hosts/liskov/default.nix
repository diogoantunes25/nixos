{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/users/dsa.nix
    ../../modules/profiles/server.nix
  ];

  networking.hostName = "liskov";

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Prevent computer from suspending when lid is down
  services.logind.lidSwitch = "ignore";

  system.stateVersion = "24.05";
}
