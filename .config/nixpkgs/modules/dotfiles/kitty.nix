{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotfiles.kitty;
in {
  options.dotfiles.kitty = {
    enable = mkEnableOption "Kitty dotfiles";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      kitty
    ];

    xdg.configFile."kitty/kitty.conf".enable = false;

    home.file.".config/kitty/" = {
      source = "${pkgs.dotfiles.kitty}/";
      recursive = true;
    };
  };
}
