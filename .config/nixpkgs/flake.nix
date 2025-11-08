{
  description = "Dotfiles for use with Nix flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zjstatus.url = "github:dj95/zjstatus";
    television.url = "github:alexpasmantier/television";
  };

  outputs = {
    self,
    zjstatus,
    television,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    homeManagerModules.dotfiles = import ./modules/home-manager;
    modules.dotfiles = import ./modules/nixos;

    overlays.default = import ./overlays {inherit zjstatus television pkgs;};
  };
}
