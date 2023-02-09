{
  pkgs,
  lib,
  ...
}: let
  nixGLWrap = import ../../nixgl {
    inherit pkgs lib;
  };
in {
  programs.kitty = {
    enable = true;
    package = nixGLWrap pkgs.kitty;
  };
}
