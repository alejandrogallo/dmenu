with import <nixpkgs> {};
let
  buildInputs = [
    binutils
    zlib
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
  ];
in
stdenv.mkDerivation {
  system = builtins.currentSystem;
  buildInputs = buildInputs;
  name = "dmenu-gallo";
  src = ./.;
  makeFlags = [ "CC:=$(CC)" ];
  preConfigure = ''
    sed -i "s@PREFIX = /usr/local@PREFIX = $out@g" config.mk
  '';
}
