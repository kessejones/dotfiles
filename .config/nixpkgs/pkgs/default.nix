{pkgs, ...}: {
  dotfiles-pkgs = pkgs.callPackage ./pkgs.nix {};
}
