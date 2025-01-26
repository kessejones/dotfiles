{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotfiles.fish;
in {
  options.dotfiles.fish = {
    enable = mkEnableOption "Fish dotfiles";
    extra-packages = mkOption {
      type = types.listOf types.package;
      default = [pkgs.gum pkgs.television];
      example = [pkgs.gum pkgs.fzf pkgs.television];
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
