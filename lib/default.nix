{lib, ...} @ args: let
  a = 2;
in {
  inherit lib;

  b = a;
}
