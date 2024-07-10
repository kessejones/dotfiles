{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {flake-utils, ...}:
    flake-utils.lib.eachDefaultSystem (system: {
      nixosModules.default = import ./modules;
    });
}
