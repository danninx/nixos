{ pkgs, ... }:
{
  networking = {
    firewall.enable = true;
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = true;
      wifi.macAddress = "stable";
      # plugins = [ pkgs.networkmanager-openvpn ];
    };
  };
  programs.ssh.startAgent = true;
  services.tailscale.enable = true;
  services.timesyncd.enable = true;
  # environment.systemPackages = with pkgs; [ openvpn ];
}
