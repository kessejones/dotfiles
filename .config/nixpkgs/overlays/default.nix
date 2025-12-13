{
  zjstatus,
  television,
  pkgs,
}: final: prev: {
  nordvpn = final.callPackage ../pkgs/nordvpn.nix {inherit pkgs;};

  zjstatus = zjstatus.packages.${prev.system}.default;
  television = television.packages.${prev.system}.default;

  dotfiles = {
    kitty = final.stdenv.mkDerivation {
      name = "kitty-dotfiles";
      src = ../../kitty;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/
        cp -r $src/* $out/

        runHook postInstall
      '';
    };

    fish = final.stdenv.mkDerivation {
      name = "fish-dotfiles";
      src = ../../fish;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/
        cp -r $src/* $out/

        runHook postInstall
      '';
    };

    git = final.stdenv.mkDerivation {
      name = "git-dotfiles";
      src = ../../..;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/
        cp -r $src/.gitconfig $out/
        cp -r $src/.gitignore_global $out/

        runHook postInstall
      '';
    };

    git-scripts = final.stdenv.mkDerivation {
      name = "git-scripts-dotfiles";
      src = ../../../.scripts/git;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/
        cp -r $src/* $out/

        runHook postInstall
      '';
    };

    zellij = final.stdenv.mkDerivation {
      name = "zellij-dotfiles";
      src = ../../zellij;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/
        cp -r $src/* $out/

        runHook postInstall
      '';
    };

    television = final.stdenv.mkDerivation {
      name = "television-dotfiles";
      src = ../../television;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/
        cp -r $src/* $out/

        runHook postInstall
      '';
    };

    fd = final.stdenv.mkDerivation {
      name = "fd-dotfiles";
      src = ../../fd;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/
        cp -r $src/* $out/

        runHook postInstall
      '';
    };

    atmos-wav = final.stdenv.mkDerivation {
      name = "atmos-wav";
      src = ../../pipewire;

      dontBuild = true;

      installPhase = ''
        runHook preInstall

        mkdir -p $out/
        cp -r $src/atmos.wav $out/

        runHook postInstall
      '';
    };
  };
}
