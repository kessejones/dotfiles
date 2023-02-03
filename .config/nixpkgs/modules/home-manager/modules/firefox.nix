{pkgs, ...}: {
  programs.firefox = {
    # enable = true;

    package = pkgs.wrapFirefox pkgs.firefox-esr-unwrapped {
      extraNativeMessagingHosts = with pkgs.nur.repos.wolfangaukang; [vdhcoapp];

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
}
