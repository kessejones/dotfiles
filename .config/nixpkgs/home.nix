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
      url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css";
      sha256 = "0yh8rbpliyjxl45dk5a67v7yn3n4b9w5z39y88imnryigq1wqigv";
    };
  in {
    enable = true;
    discordAlias = true;

    css = builtins.readFile (builtins.fetchurl src);
  };

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
    (nixGLWrap kitty)
  ];
}
