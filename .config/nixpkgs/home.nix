{
  config,
  pkgs,
  nur,
  ...
}: let
  username = "kesse";
in {
  home = {
    inherit username;

    homeDirectory = "/home/${username}";
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;
    profiles.default.search = {
      default = "DuckDuckGo";
    };
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraNativeMessagingHosts = with nur.repos.wolfangaukang; [vdhcoapp];

      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        FirefoxHome = {
          Pocket = false;
          Snippets = false;
        };
        UserMessaging = {
          ExtensionRecomendations = false;
          SkipOnboarding = true;
        };
      };

      extraPrefs = ''
        lockPref("security.identityblock.show_extended_validation", true);
        lockPref("devtools.theme", "dark");
        lockPref("media.peerconnection.enabled", false);
        lockPref("geo.enabled", false);
        lockPref("dom.battery.enabled", false);
        lockPref("beacon.enabled", false);
        lockPref("dom.event.contextmenu.enabled", false);
        lockPref("network.IDN_show_punycode", false);
        lockPref("network.IDN_show_punycode", true);
        lockPref("browser.tabs.tabmanager.enabled", false);
      '';
    };
  };

  programs.discocss = let
    src = {
      url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css";
      sha256 = "0jby4bhabqmsgkv74n9chsjraa46h55vcn5zfk988mwhbxjixj8l";
    };
  in {
    enable = true;
    discordAlias = true;

    css = builtins.readFile (builtins.fetchurl src);
  };

  home.packages = with pkgs; [
    btop
    fish
    tmux
    neovim
  ];
}
