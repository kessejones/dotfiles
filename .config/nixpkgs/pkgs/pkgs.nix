{pkgs, ...}:
with pkgs; {
  kitty = stdenv.mkDerivation {
    name = "kitty-dotfiles";
    src = ../../kitty;
    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r $src/* $out/
      runHook postInstall
    '';
  };

  fish = final.stdenv.mkDerivation {
    name = "fish-dotfiles";
    src = ../../fish;
    installPhase = ''
      runHook preInstall

      mkdir -p $out
      cp -r $src/* $out/

      runHook postInstall
    '';
  };
}
