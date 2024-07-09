{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {flake-utils, ...}:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import (inputs.nixpkgs) {inherit system;};
    in {
      packages = {
        kitty = pkgs.stdenv.mkDerivation {
          name = "kitty-dotfiles";
          src = ../kitty;
          installPhase = ''
            runHook preInstall
            mkdir -p $out
            cp -r $src/* $out/
            runHook postInstall
          '';
        };

        fish = pkgs.stdenv.mkDerivation {
          name = "fish-dotfiles";
          src = ../fish;
          installPhase = ''
            runHook preInstall

            mkdir -p $out
            cp -r $src/* $out/

            runHook postInstall
          '';
        };
      };
    });
}
