{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotfiles.fish;
  pkgs = import ../../pkgs;
in {
  options.dotfiles.fish = {
    enable = mkEnableOption "Fish dotfiles";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fish
    ];

    # xdg.configFile."fish/config.fish".enable = false;
    xdg.configFile."fish/config.fish" = {
      source = "${pkgs.dotfiles.fish}/share/fish";
      recursive = true;
    };

    # home.file.".config/fish/" = {
    #   source = "${pkgs.dotfiles.fish}/share/fish";
    #   recursive = true;
    # };
  };
}
