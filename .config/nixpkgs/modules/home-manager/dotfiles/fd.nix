{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotfiles.fd;
in {
  options.dotfiles.fd = {
    enable = mkEnableOption "fd dotfiles";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fd
    ];

    xdg.configFile."fd" = {
      source = "${pkgs.dotfiles.fd}";
      recursive = true;
    };
  };
}
