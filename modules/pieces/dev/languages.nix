{
  config,
  lib,
  pkgs,
  ...
}:

let
    # Custom package from <root>/pkgs
    spinrcp = pkgs.callPackage ../../../pkgs/spinrcp.nix { };
in
{
	environment.systemPackages = with pkgs; [
			coq
			coqPackages.coqide

			ocaml

      # dafny
      # FIXME: Dafny was not working properly (used stateful way in vscode)
      #(vscode-with-extensions.override {
      #  vscodeExtensions = with vscode-extensions; [
      #      vscodevim.vim
      #      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      #        {
      #          name = "ide-vscode";
      #          publisher = "dafny-lang";
      #          version = "3.3.1";
      #          sha256 = "4oxdgRzUx8p84gvov0nTUTg6yjoCLt4yaZaovDMi+b4=";
      #        }
      #      ];
      #})

      vscode.fhs # HACK: Dafny woudnl't work with the appropriate install (via Nix)

			gcc
			gnumake
			gdb
      bear # for the compilation database
      clang-tools # for linting in neovim
      boost

      # Compilers
			flex
			bison
			yasm

      # Lisp
			# chez
			# sbcl

      # dotnet-runtime

			(python311.withPackages (ps: [
									 ps.seaborn
									 ps.pandas
									 ps.numpy
									 ps.jupyter
									 ps.pytube
									 ps.virtualenv
									 ps.requests
			]))
			python311Packages.pip
			python311Packages.virtualenv

			nodejs_22

			go

			cargo
			rustc
			rustfmt

      spinrcp
      spin
  ];

  # Allow unfree packages (for VSCode)
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.permittedInsecurePackages = ["electron-25.9.0" ];
}
