# Framework 13 pro (intel ultra series 3) config defaults
# based on nixos-hardware for same model and cachyos tunings; not to be used alongside the nixos-hardware module
{ config, lib, pkgs, ... }:
{
  boot = {
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    kernelParams = [ "nvme.noacpi=1" ];

    blacklistedKernelModules = [ "cros-usbpd-charger" ];
    extraModulePackages = [ config.boot.kernelPackages.framework-laptop-kmod ];

    kernelModules = [
      "cros_ec"
      "cros_ec_lpcs"
    ];

    initrd.kernelModules = [
      "xe"
    ];

    kernel.sysctl = {
      "kernel.nmi_watchdog" = 0;
      "vm.compaction_proactiveness" = 0;
      "vm.dirty_writeback_centisecs" = 1500;
      "vm.page-cluster" = 0;
      "vm.swappiness" = 100;
      "vm.watermark_boost_factor" = 0;
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 40;
  };

  systemd = {
    tmpfiles.rules = [
      "w- /sys/kernel/mm/lru_gen/min_ttl_ms - - - - 1000"
    ];

    oomd.enableUserSlices = true;
  };

  hardware = {
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;

    graphics = {
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
        vpl-gpu-rt
      ];

      extraPackages32 = with pkgs; [
        driversi686Linux.intel-media-driver
      ];
    };

    sensor.iio.enable = lib.mkDefault true;
    acpilight.enable = lib.mkDefault true;
  };

  services = {
    power-profiles-daemon.enable = true;
    thermald.enable = true;

    fwupd.enable = true;
    fprintd.enable = true;
    fstrim.enable = lib.mkDefault true;

    udev.extraRules = ''
      # Ethernet expansion card support
      ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="8156", ATTR{power/autosuspend}="20"
    '';

    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
  };

  environment.systemPackages = with pkgs; [
    fw-ectool
    framework-tool
  ];
}
