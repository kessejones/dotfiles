{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotfiles.kitty;
in {
  options.dotfiles.git = {
    enable = mkEnableOption "Git dotfiles";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      git
    ];

    home.file.".gitconfig".source = "${pkgs.dotfiles.git}/.gitconfig";
    home.file.".gitignore-global".source = "${pkgs.dotfiles.git}/.gitignore_global";
    home.file.".scripts/git".source = "${pkgs.dotfiles.git-scripts}/";
  };
}
