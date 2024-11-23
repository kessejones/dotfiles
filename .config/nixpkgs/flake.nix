{
  outputs = _: {
    homeManagerModules.dotfiles = import ./modules;
    overlays.default = import ./overlays;
  };
}
