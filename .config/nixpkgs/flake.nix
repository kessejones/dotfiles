{
  outputs = {pkgs, ...}: {
    packages.x86_64-linux = {
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
}
