
{ pkgs, ... }:

{
  users.users.dsa = {
    isNormalUser = true;
    description = "Marta Antunes";
    extraGroups = [ "networkmanager" ];
		packages = with pkgs; [
			google-chrome
			zoom-us
			vscode
			libsForQt5.okular # PDF viewer
			spotify
      libreoffice-qt
			xfce.ristretto # image viewer
			flameshot
		];
		shell = pkgs.fish;
		useDefaultShell = true;
  };
}

