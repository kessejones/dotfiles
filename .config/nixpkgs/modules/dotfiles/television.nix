{
  config,
  lib,
  pkgs,
  unstable-pkgs,
  ...
}:
with lib; let
  cfg = config.dotfiles.television;
in {
  options.dotfiles.television = {
    enable = mkEnableOption "Television dotfiles";

    package = mkOption {
      type = types.package;
      default = unstable-pkgs.television;
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
