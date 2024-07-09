{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.dotilfes.fish;
in {
  options.modules.modules.dotfiles.fish = {enable = mkBoolOpt false;};

  config = mkIf cfg.enable {
    home-manager.home.packages = with pkgs; [
      fish
    ];

    xdg.configFiles."fish".source = ../../fish;
  };
}
