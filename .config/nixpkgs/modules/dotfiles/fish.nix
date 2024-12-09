{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotfiles.fish;
  pkgs = import ../../pkgs;
in {
  options.dotfiles.fish = {
    enable = mkEnableOption "Fish dotfiles";
    extra-packages = mkOption {
      type = types.listOf types.package;
      default = [];
      example = [pkgs.gum pkgs.fzf];
      description = "Packages required this fish configuration";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;
      [
        fish
      ]
      ++ cfg.dotfiles.fish.extra-packages;

    xdg.configFile."fish" = {
      source = "${pkgs.dotfiles.fish}";
      recursive = true;
    };
  };
}
