{ pkgs, ... }: {
  imports = [
      ./gandicloud.nix
      ../users/dsa.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dsa = {
    isNormalUser = true;
    home  = "/home/dsa";
    description = "Diogo";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  networking.hostName = "brouwer";

  environment.systemPackages = with pkgs; [
   vim
   neovim
   emacs
   git
   wget
   zip
   unzip
   curl
   htop
   python3
  ];

  security.acme = {
    acceptTerms = true;
    defaults.email = "diogo.santiago.pt@gmail.com";
  };

  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      "dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/blog.dsantunes.com/";
      };
      "ntfy.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        locations = {
	  "/".proxyPass = "http://127.0.0.1:7115";
	};
      };
      "board.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/board.dsantunes.com/";
      };
      "overleaf.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        locations = {
	  "/".proxyPass = "http://127.0.0.1:10000";
	};
      };
      "r2s2.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/r2s2.dsantunes.com/";
      };
      "mpc.dsantunes.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/mpc.dsantunes.com/";
      };
    };
  };

  services.ntfy-sh = {
    enable = true;
    settings = {
      listen-http = "127.0.0.1:7115";
      base-url = "https://ntfy.dsantunes.com";
    };
  };

  services.tailscale.enable = true;

  # enable docker
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };

  # Turned off because it caused problems when
  # getting golang dependencies from Google
  # (used in stats monitor)
  networking.enableIPv6  = false;
}
