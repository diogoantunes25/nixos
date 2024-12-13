{
  description = "Diogo Antunes Nix[OS] configuration for hosts";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-24.05";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    phdw = {
      # FIXME: move to github link
      url = "git+file:///home/dsa/work/small-projects/personal-websites/live/dashboard";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    flake-utils,
    agenix,
    home-manager,
    phdw
  } @ inputs : let

    # modules shared by all hosts
    shared-modules = [
      inputs.agenix.nixosModules.default
      inputs.home-manager.nixosModules.home-manager {
        home-manager = {
          useUserPackages = true;
        };
      }
    ];
  in
  {
    nixosConfigurations = {
      # NOTE: Place where module system in instantiated
      shannon = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = shared-modules ++ [ ./hosts/shannon ];

        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
          };

          inherit phdw inputs;
        };
      };

      brouwer = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = shared-modules ++ [ ./hosts/brouwer ];

        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
          };

          inherit phdw inputs;
        };
      };

      liskov = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = shared-modules ++ [ ./hosts/liskov ];

        specialArgs = {
          pkgs-unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
          };
        };
      };
    };

    homeConfigurations = {
      "dsa@shannon" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        modules = [ ./home-manager/home.nix ];
      };
    };
  };
}
