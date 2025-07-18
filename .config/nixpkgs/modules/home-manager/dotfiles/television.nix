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

    package = mkOption {
      type = types.package;
      default = pkgs.television;
      example = pkgs.television;
      description = "Television package";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [cfg.package];

    xdg.configFile."television" = {
      source = "${pkgs.dotfiles.television}";
      recursive = true;
    };
  };
}
