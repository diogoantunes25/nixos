{ pkgs, ... }: {
  imports = [
    ./gandicloud.nix
    ../../modules/users/dsa.nix
    ../../modules/profiles/server.nix

    ../../modules/pieces/services/ntfy.nix
    ../../modules/pieces/services/projectPages.nix
    ../../modules/pieces/services/website.nix
    ../../modules/pieces/services/dashboard.nix
    ../../modules/pieces/services/rss.nix
  ];

  networking.hostName = "brouwer";
}
