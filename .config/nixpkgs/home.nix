{
  config,
  pkgs,
  lib,
  ...
}: let
  username = "kesse";
  nixGLWrap = import ./modules/nixgl {inherit pkgs lib;};
in {
  imports = [./modules/home-manager];

  home = {
    inherit username;

    homeDirectory = "/home/${username}";
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;

  programs.go.enable = true;

  home.packages = with pkgs; [
    nixgl.auto.nixGLDefault

    # utils
    btop
    exa
    unzip

    # setup requirements
    fish
    tmux
    fzf
    gum
    ripgrep
    tree-sitter
    alejandra

    # Dev
    git
    gh
    neovim
    cargo
    gcc
    gnumake
    php
    php.packages.composer
    nodejs

    (nixGLWrap alacritty)

    (nixGLWrap firefox)
    (nixGLWrap librewolf)

    pkgs.nur.repos.wolfangaukang.vdhcoapp
  ];
}
