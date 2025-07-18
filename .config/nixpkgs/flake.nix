{
  description = "Dotfiles for use with Nix flakes";

  inputs = {
    zjstatus.url = "github:dj95/zjstatus";
    television.url = "github:alexpasmantier/television";
  };

  outputs = {
    self,
    zjstatus,
    television,
  }: {
    homeManagerModules.dotfiles = import ./modules/home-manager;
    modules.dotfiles = import ./modules/nixos;

    overlays.default = import ./overlays {inherit zjstatus television;};
  };
}
