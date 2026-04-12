{ ... }: {
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = true;
      wifi.macAddress = "random";
      plugins = [ ];
    };
  };
}
