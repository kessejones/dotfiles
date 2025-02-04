{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotfiles.television;
in {
  options.dotfiles.television = {
    enable = mkEnableOption "Television dotfiles";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      television
    ];

    xdg.configFile."television" = {
      source = "${pkgs.dotfiles.television}";
      recursive = true;
    };
  };
}
