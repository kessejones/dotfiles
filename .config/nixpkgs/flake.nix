{
  description = "Dotfiles for use with Nix flakes";

  inputs = {
    zjstatus.url = "github:dj95/zjstatus";
  };

  outputs = {zjstatus}: {
    homeManagerModules.dotfiles = import ./modules;
    overlays.default = import ./overlays {inherit zjstatus;};
  };
}
