{
  config,
  pkgs,
  nur,
  lib,
  nixGL,
  ...
}: let
  username = "kesse";

  nixgl = import nixGL {inherit pkgs;};

  nixGLWrap = pkg:
    pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
      mkdir $out
      ln -s ${pkg}/* $out
      rm $out/bin
      mkdir $out/bin
      for bin in ${pkg}/bin/*; do
        wrapped_bin=$out/bin/$(basename $bin)
        echo "exec ${lib.getExe nixgl.auto.nixGLDefault} $bin \"\$@\"" > $wrapped_bin
        chmod +x $wrapped_bin
      done
    '';
in {
  home = {
    inherit username;

    homeDirectory = "/home/${username}";
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;
    profiles.default.search = {
      default = "DuckDuckGo";
    };

    package = import ./pkgs/firefox.nix {
      inherit pkgs nur;
    };
  };

  programs.discocss = let
    src = {
      url = "https://github.com/catppuccin/discord.git";
      ref = "refs/heads/gh-pages";
    };

    catppuccin-files = builtins.fetchGit src;
    theme-file = "${catppuccin-files}/dist/catppuccin-mocha.theme.css";
  in {
    enable = true;
    discordAlias = true;

    css = builtins.readFile theme-file;
  };

  programs.kitty = {
    enable = true;

    theme = "Catppuccin-Mocha";
    font = {
      name = "Hack Nerd Font";
      size = 13;
    };

    settings = {
      cursor_blink_interval = 0;
      cursor_stop_blinking_after = 0;
      window_padding_width = 5;
    };

    package = nixGLWrap pkgs.kitty;
  };

  programs.go.enable = true;

  home.packages = with pkgs; [
    nixgl.auto.nixGLDefault

    btop
    fish
    tmux
    neovim
    fzf
    tree-sitter
    exa
    ripgrep
    gum
    git

    (nixGLWrap alacritty)
  ];
}
