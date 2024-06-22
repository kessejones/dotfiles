{
  outputs = {pkgs, ...}: {
    packages.x86_64-linux = {
      wezterm = pkgs.mkDerivation {
        src = ../wezterm;
        installPhase = ''
          mkdir -p $out
          cp -r $src/* $out/
        '';
      };
    };
  };
}
