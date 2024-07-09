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
          src = ./.config/kitty;
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
