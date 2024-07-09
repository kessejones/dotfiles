{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      system = ["x86_64-linux" "aarch64-linux"];
      perSystem = {pkgs, ...}: {
        packages = {
          kitty = pkgs.mkDerivation {
            src = ../kitty;
            installPhase = ''
              runHook preInstall

              mkdir -p $out
              cp -r $src/* $out/

              runHook postInstall
            '';
          };

          wezterm = pkgs.mkDerivation {
            src = ../wezterm;
            installPhase = ''
              runHook preInstall

              mkdir -p $out
              cp -r $src/* $out/

              runHook postInstall
            '';
          };
        };
      };
    };
}
