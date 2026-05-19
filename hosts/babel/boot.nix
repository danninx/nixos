{ ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    grub = {
      configurationLimit = 8;
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
      extraEntriesBeforeNixOS = false;
      extraEntries = ''
        menuentry "Reboot" {
            reboot
        }
        menuentry "Poweroff" {
            halt
        }
      '';
      useOSProber = true;
    };
  };
}
