{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nurpkgs.url = "github:nix-community/NUR";
  };

  outputs = inputs: let
    system = "x86_64-linux";
  in {
    defaultPackage.x86_64-linux = inputs.home-manager.defaultPackage.x86_64-linux;
    homeConfigurations = import ./home-conf.nix {
      inherit inputs system;
    };
  };
}
