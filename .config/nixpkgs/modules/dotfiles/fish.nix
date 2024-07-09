{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.dotfiles.fish;
in {
  options.modules.dotfiles.fish = {enable = mkBoolOpt false;};

  config = mkIf cfg.enable {
    home-manager.home.packages = with pkgs; [
      fish
    ];

    xdg.configFile."fish" = {
      source = ../../fish;
      recursive = true;
    };
  };
}
