{ config, ... }:

let
  lockVal = val: {
    Value = val;
    Status = "locked";
  };
in
{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    languagePacks = [
      "en-US"
    ];

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableMasterPasswordCreation = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;

      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      ExtensionSettings = {
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4721638/ublock_origin-1.70.0.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # Privacy Badger
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4700632/privacy_badger17-2026.2.20.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # Proton Pass
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4768005/proton_pass-1.36.1.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # Tokyo Night Theme
        "{afda92c3-008d-4d08-8766-3f1571995071}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/3872556/tokyo_night_v2-1.0.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };

      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      PasswordManagerEnabled = false;

      Preferences = {
        "extensions.pocket.enabled" = lockVal false;
        "extensions.screenshots.disabled" = lockVal true;
        "browser.formfill.enable" = lockVal false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lockVal false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lockVal false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = lockVal false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lockVal false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lockVal false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lockVal false;
        "browser.newtabpage.activity-stream.showSponsored" = lockVal false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lockVal false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lockVal false;
        "browser.topsites.contile.enabled" = lockVal false;
      };
    };
  };
}
