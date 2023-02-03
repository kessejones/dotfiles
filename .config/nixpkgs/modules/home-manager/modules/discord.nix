{pkgs, ...}: {
  programs.discocss = {
    enable = true;
    discordAlias = true;

    css = builtins.readFile "${pkgs.customDiscocss.catppuccin}/dist/catppuccin-mocha.theme.css";
  };
}
