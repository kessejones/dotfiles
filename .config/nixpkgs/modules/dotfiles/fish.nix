{
  config,
  lib,
  ...
}: let
  cfg = config.modules.dotfiles.fish;
  pkgs = import ../../pkgs;
in {
  options.modules.dotfiles.fish = {enable = lib.mkBoolOpt false;};

  config = lib.mkIf cfg.enable {
    home-manager.home.packages = with pkgs; [
      fish
    ];

    xdg.configFile."fish" = {
      source = config.lib.file.mkOutOfStoreSymlink pkgs.dotfiles-pkgs.fish;
      recursive = true;
    };
  };
}
