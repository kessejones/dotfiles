{
  autoPatchelfHook,
  buildFHSEnvChroot ? false,
  buildFHSUserEnv ? false,
  dpkg,
  fetchurl,
  lib,
  stdenv,
  sysctl,
  iptables,
  iproute2,
  procps,
  cacert,
  libxml2,
  libidn2,
  libnl,
  libcap_ng,
  zlib,
  wireguard-tools,
}: let
  pname = "nordvpn";
  version = "4.2.1";
  maintainer = {
    name = "Kesse Jones";
    github = "kessejones";
  };
  buildEnv =
    if builtins.typeOf buildFHSEnvChroot == "set"
    then buildFHSEnvChroot
    else buildFHSUserEnv;

  nordVPNBase = stdenv.mkDerivation {
    inherit pname version;

    src = fetchurl {
      url = "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/nordvpn_${version}_amd64.deb";
      hash = "sha256-DMyNPc08txvkAB3QKK4ViHomsr3Z3l6JerUQ0zuRlro=";
    };

    buildInputs = [libxml2 libidn2 libnl libcap_ng];
    nativeBuildInputs = [dpkg autoPatchelfHook stdenv.cc.cc.lib];

    dontConfigure = true;
    dontBuild = true;

    unpackPhase = ''
      runHook preUnpack
      dpkg --extract $src .
      runHook postUnpack
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      mv usr/* $out/
      mv var/ $out/
      mv etc/ $out/
      runHook postInstall
    '';
  };

  nordVPNfhs = buildEnv {
    name = "nordvpnd";
    runScript = "nordvpnd";

    # hardcoded path to /sbin/ip
    targetPkgs = pkgs: [
      nordVPNBase
      sysctl
      iptables
      iproute2
      procps
      cacert
      libxml2
      libidn2
      libnl
      libcap_ng
      zlib
      wireguard-tools
    ];
  };
in
  stdenv.mkDerivation {
    inherit pname version;

    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin $out/share
      ln -s ${nordVPNBase}/bin/nordvpn $out/bin
      ln -s ${nordVPNfhs}/bin/nordvpnd $out/bin
      ln -s ${nordVPNBase}/share* $out/share
      ln -s ${nordVPNBase}/var $out/
      runHook postInstall
    '';

    meta = with lib; {
      description = "CLI client for NordVPN";
      homepage = "https://www.nordvpn.com";
      license = licenses.unfree;
      maintainers = [maintainer];
      platforms = [
        "x86_64-linux"
      ];
    };
  }
