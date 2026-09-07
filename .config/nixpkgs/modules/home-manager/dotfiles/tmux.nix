{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotfiles.tmux;
in {
  options.dotfiles.tmux = {
    enable = mkEnableOption "tmux dotfiles";
    package = mkOption {
      type = types.package;
      default = pkgs.unstable.tmux;
      example = pkgs.tmux;
      description = "tmux package";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [
      cfg.package
    ];

    xdg.configFile."tmux/tmux.conf".enable = false;
    home.file.".config/tmux/" = {
      source = "${pkgs.dotfiles.tmux}/";
      recursive = true;
    };
  };
}
