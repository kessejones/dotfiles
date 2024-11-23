final: prev: {
  dotfiles = {
    kitty = final.stdenv.mkDerivation {
      name = "kitty-dotfiles";
      src = ../../kitty;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/usr/share/kitty
        cp -r $src/* $out/usr/share/kitty

        runHook postInstall
      '';
    };

    fish = final.stdenv.mkDerivation {
      name = "fish-dotfiles";
      src = ../../fish;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/usr/share/fish
        cp -r $src/* $out/usr/share/fish/

        runHook postInstall
      '';
    };
  };
}
