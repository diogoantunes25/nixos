{
  pkgs,
  lib
}:
pkgs.stdenv.mkDerivation {
  pname = "SpinRCP";

  version = "3.11";
  src = fetchTarball {
    url = "http://lms.uni-mb.si/spinrcp/releases/SpinRCP311-linux64.zip";
    sha256 = "13d2m13nkymd6d39h94sxc2n9jh2nkjhmcg5q64b0xiay58x68sr";
  };

  nativeBuildInputs = [
    pkgs.autoPatchelfHook
    pkgs.makeWrapper
  ];

  buildInputs = [ pkgs.spin pkgs.jdk8 pkgs.swt pkgs.xorg.libXtst ];

  installPhase = ''
    mkdir -p $out/bin
    cp -r . $out/bin
    cd $out/bin

    echo "-vm" > SpinRCP.ini
    echo "${pkgs.jdk8}/bin/java" > SpinRCP.ini

    chmod u+x ./SpinRCP
    '';

  postFixup = ''
    mv $out/bin/SpinRCP $out/bin/SpinRCPUnwrapped
    makeWrapper $out/bin/SpinRCPUnwrapped $out/bin/SpinRCP --set PATH ${lib.makeBinPath [ pkgs.jdk8 pkgs.xorg.libXtst ]} --set LD_LIBRARY_PATH ${pkgs.xorg.libXtst}/lib
  '';
}
