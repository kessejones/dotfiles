{
  inputs,
  system,
  ...
}:
with inputs; let
  pkgs = import nixpkgs {
    inherit system;

    overlays = [
      (import ./modules/overlays)
      nixgl.overlay
    ];

    config.allowUnfree = true;
    config.packageOverrides = pkgs: {
      nur = import nurpkgs {
        inherit pkgs;
      };
    };
  };

  imports = [
    ./home.nix
  ];
in {
  kesse = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [{inherit imports;}];
  };
}
