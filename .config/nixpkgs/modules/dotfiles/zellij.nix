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
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zellij
    ];

    xdg.configFile."zellij/zellij.kdl".enable = false;
    xdg.dataFile."zjstatus.wasm".source = "${pkgs.zjstatus}/share/zjstatus.wasm";

    home.file.".config/zellij/" = {
      source = "${pkgs.dotfiles.zellij}/";
      recursive = true;
    };
  };
}
