{
  description = "Dotfiles for use with Nix flakes";

  inputs = {
    zjstatus.url = "github:dj95/zjstatus";
  };

  outputs = {
    self,
    zjstatus,
  }: {
    homeManagerModules.dotfiles = import ./modules/home-manager;
    modules.dotfiles = import ./modules/nixos;

    overlays.default = import ./overlays {inherit zjstatus;};
  };
}
