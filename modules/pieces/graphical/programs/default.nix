/**
  GUI software
*/
{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./obsidian.nix ];

	environment.systemPackages = with pkgs; [
    # Browser
    google-chrome
    firefox
    nyxt

    # Mail
    thunderbird

    # PDFs
    libsForQt5.okular

    # Images / videos
		mpv # video player
		xfce.ristretto # image viewer
		imv # image viewer
		feh # terrible image viewer
		openshot-qt # video editor

    # Documents
    libreoffice-qt

    # Communication
		mattermost-desktop

    # Other
		zoom-us
    skypeforlinux
		spotify
    zotero
    obs-studio
    geogebra
    discord
  ];
}
