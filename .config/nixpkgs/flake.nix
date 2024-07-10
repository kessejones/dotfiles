{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = {...}: {
    nixosModules.default = import ./modules;
  };
}
