{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.${system} = {
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
  };
}
