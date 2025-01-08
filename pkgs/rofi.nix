# FIXME: this is  probably not the correct way to this
# This is the published version  of rofi.nix, but with changed url for github

{
  stdenv,
  lib,
  fetchFromGitHub,
  meson,
  ninja,
  pkg-config,
  libxkbcommon,
  pango,
  which,
  git,
  cairo,
  libxcb,
  xcbutil,
  xcbutilwm,
  xcbutilxrm,
  xcb-util-cursor,
  libstartup_notification,
  bison,
  flex,
  librsvg,
  check,
  glib,
  buildPackages,
}:

stdenv.mkDerivation rec {
  # FIXME: use original name
  pname = "dsa-rofi";
  version = "1.7.5";

  src = fetchFromGitHub {
    owner = "diogoantunes25";
    repo = "rofi";
    rev = "fc92934329b3fa14a76efe9411e0c25a28911458";
    fetchSubmodules = true;
    sha256 = "sha256-3XFusKeckagEPfbLtt1xAVTEfn1Qebdi/Iq1AYbHCR4=";
  };

  preConfigure = ''
    patchShebangs "script"
    # root not present in build /etc/passwd
    sed -i 's/~root/~nobody/g' test/helper-expand.c
  '';

  depsBuildBuild = [
    buildPackages.stdenv.cc
    pkg-config
    glib
  ];
  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    flex
    bison
  ];
  buildInputs = [
    libxkbcommon
    pango
    cairo
    git
    librsvg
    check
    libstartup_notification
    libxcb
    xcbutil
    xcbutilwm
    xcbutilxrm
    xcb-util-cursor
    which
  ];

  doCheck = false;

  meta = with lib; {
    description = "Window switcher, run dialog and dmenu replacement";
    homepage = "https://github.com/diogoantunes25/rofi";
    license = licenses.mit;
    maintainers = with maintainers; [ bew ];
    platforms = with platforms; linux;
    mainProgram = "rofi";
  };
}
