{
  inputs = {
    utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = {
    nixpkgs,
    utils,
    ...
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        packages = {
          kitty = pkgs.mkDerivation {
            src = ../kitty;
            installPhase = ''
              runHook preInstall

              mkdir -p $out
              cp -r $src/* $out/

              runHook postInstall
            '';
          };

          wezterm = pkgs.mkDerivation {
            src = ../wezterm;
            installPhase = ''
              runHook preInstall

              mkdir -p $out
              cp -r $src/* $out/

              runHook postInstall
            '';
          };
        };
      }
    );
}
