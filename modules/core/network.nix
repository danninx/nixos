{ ... }:
{
  networking = {
    firewall.enable = true;
    firewall.checkReversePath = false;
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = true;
      wifi.macAddress = "stable";
    };
  };
  programs.ssh.startAgent = false;
  services.tailscale.enable = true;
  services.timesyncd.enable = true;
}
