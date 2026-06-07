{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotfiles.zellij;
in {
  options.dotfiles.zellij = {
    enable = mkEnableOption "Zellij dotfiles";
    package = mkDefault pkgs.unstable.zellij;
  };

  config = mkIf cfg.enable {
    home.packages = [
      cfg.package
    ];

    xdg.configFile."zellij/zellij.kdl".enable = false;
    xdg.dataFile."zjstatus.wasm".source = "${pkgs.zjstatus}/bin/zjstatus.wasm";

    home.file.".config/zellij/" = {
      source = "${pkgs.dotfiles.zellij}/";
      recursive = true;
    };
  };
}
