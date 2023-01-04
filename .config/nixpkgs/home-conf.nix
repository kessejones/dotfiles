{
  inputs,
  system,
  ...
}:
with inputs; let
  pkgs = import nixpkgs {
    inherit system;

    config.allowUnfree = true;
  };

  nur = import nurpkgs {
    inherit pkgs;

    nurpkgs = pkgs;
  };

  imports = [
    ./home.nix
  ];
in {
  kesse = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [{inherit imports;}];

    extraSpecialArgs = {
      inherit nur;
    };
  };
}
