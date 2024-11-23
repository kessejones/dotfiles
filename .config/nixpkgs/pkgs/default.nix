{pkgs, ...}: {
  dotfiles = pkgs.callPackage ./pkgs.nix {};
}
