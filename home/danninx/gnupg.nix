{ pkgs, ... }:

{
  programs.gpg = {
    enable = true;

    scdaemonSettings = {
      disable-ccid = true;
    };

    settings = {
      keyid-format = "0xlong";
      with-fingerprint = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableScDaemon = true;

    pinentry.package = pkgs.pinentry-qt;

    defaultCacheTtl = 600;
    maxCacheTtl = 7200;

    enableZshIntegration = true;
  };
}
