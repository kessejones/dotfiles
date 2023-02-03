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

    theme = "Catppuccin-Mocha";
    font = {
      name = "Hack Nerd Font";
      size = 13;
    };

    settings = {
      cursor_blink_interval = 0;
      cursor_stop_blinking_after = 0;
      window_padding_width = 5;
    };

    package = nixGLWrap pkgs.kitty;
  };
}
