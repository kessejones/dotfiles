{
  description = "Dotfiles for use with Nix flakes";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zjstatus.url = "github:dj95/zjstatus";
    television.url = "github:alexpasmantier/television";
  };

  outputs = {
    self,
    zjstatus,
    television,
    nixpkgs,
    flake-utils,
  }: let
    modules = {
      homeManagerModules.dotfiles = import ./modules/home-manager;
      modules.dotfiles = import ./modules/nixos;
    };
  in
    modules
    // flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      overlays.default = import ./overlays {inherit zjstatus television pkgs;};
    });
}
