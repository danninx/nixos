# flattened copy of nixos-hardware's framework/13-inch/intel-core-ultra-series3 with imports included
{
  config,
  lib,
  pkgs,
  ...
}:
let
  kernelVersion = config.boot.kernelPackages.kernel.version;
  gpuCfg = config.hardware.intelgpu;
  useIntelVaapiDriver = gpuCfg.vaapiDriver == "intel-vaapi-driver" || gpuCfg.vaapiDriver == null;
  intel-vaapi-driver = (pkgs.intel-vaapi-driver or pkgs.vaapiIntel).override {
    enableHybridCodec = gpuCfg.enableHybridCodec;
  };
  intel-vaapi-driver-32 =
    (pkgs.driversi686Linux.intel-vaapi-driver or pkgs.driversi686Linux.vaapiIntel).override
      {
        enableHybridCodec = gpuCfg.enableHybridCodec;
      };

  useIntelOcl =
    useIntelVaapiDriver
    && (config.hardware.enableAllFirmware or config.nixpkgs.config.allowUnfree or false);

  useIntelMediaDriver = gpuCfg.vaapiDriver == "intel-media-driver" || gpuCfg.vaapiDriver == null;
  intel-compute-runtime =
    if gpuCfg.computeRuntime == "legacy" then
      pkgs.intel-compute-runtime-legacy1
    else
      pkgs.intel-compute-runtime;
  intel-media-runtime =
    if gpuCfg.mediaRuntime == "vpl-gpu-rt" then
      pkgs.vpl-gpu-rt or pkgs.onevpl-intel-gpu
    else
      pkgs.intel-media-sdk;
in
{
  options.hardware = {
    framework.enableKmod =
      (lib.mkEnableOption "the community-created Framework kernel module that allows interacting with the embedded controller from sysfs.")
      // {
        default = lib.versionAtLeast kernelVersion "6.10";
        defaultText = "enabled by default if kernel >= 6.10";
      };

    intelgpu = {
      driver = lib.mkOption {
        description = "Intel GPU driver to use";
        type = lib.types.enum [
          "i915"
          "xe"
        ];
        default = "i915";
      };

      loadInInitrd =
        lib.mkEnableOption "Load the Intel GPU kernel module at stage 1 boot. (Added to `boot.initrd.kernelModules`)"
        // {
          default = true;
        };

      computeRuntime = lib.mkOption {
        description = "intel-compute-runtime variant to use (legacy for Gen8–11, default for Gen12+)";
        type = lib.types.enum [
          "default"
          "legacy"
        ];
        default = "default";
      };

      mediaRuntime = lib.mkOption {
        description = "Intel media runtime to use (Media SDK for Gen8–11, OneVPL for Gen12+)";
        type = lib.types.enum [
          "vpl-gpu-rt"
          "intel-media-sdk"
        ];
        default = "vpl-gpu-rt";
      };

      vaapiDriver = lib.mkOption {
        description = "Intel VAAPI driver to use (use null to use both)";
        type = lib.types.nullOr (
          lib.types.enum [
            "intel-vaapi-driver"
            "intel-media-driver"
          ]
        );
        default = null;
      };

      enableHybridCodec = lib.mkEnableOption "hybrid codec support for Intel GPUs";
    };
  };

  config = lib.mkMerge [
    {
      boot = {
        kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "6.17") (
          lib.mkDefault pkgs.linuxPackages_latest
        );

        kernelParams = [
          "nvme.noacpi=1"
        ];

        blacklistedKernelModules = [
          "cros-usbpd-charger"
        ]
        ++ lib.optionals (!config.hardware.enableRedistributableFirmware) [ "ath3k" ];

        initrd.kernelModules =
          lib.optionals config.boot.initrd.unl0kr.enable [
            "intel_lpss_pci"
            "i2c_hid_acpi"
            "i2c_hid"
            "hid_multitouch"
            "hid_generic"
          ]
          ++ lib.optionals gpuCfg.loadInInitrd [ gpuCfg.driver ];
      };

      services = {
        fwupd.enable = true;
        fprintd.enable = lib.mkDefault true;
        tlp.enable = true;
        fstrim.enable = true;

        udev.extraRules = ''
          # Ethernet expansion card support
          ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="8156", ATTR{power/autosuspend}="20"
        '';
      };

      hardware = {
        # https://github.com/NixOS/nixpkgs/issues/171093
        acpilight.enable = lib.mkDefault true;

        sensor.iio.enable = lib.mkDefault true;
        cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

        graphics = {
          extraPackages =
            lib.optionals useIntelVaapiDriver [ intel-vaapi-driver ]
            ++ lib.optionals useIntelOcl [ pkgs.intel-ocl ]
            ++ lib.optionals useIntelMediaDriver [
              pkgs.intel-media-driver
              intel-compute-runtime
              intel-media-runtime
            ];

          extraPackages32 =
            lib.optionals useIntelVaapiDriver [ intel-vaapi-driver-32 ]
            ++ lib.optionals useIntelMediaDriver [ pkgs.driversi686Linux.intel-media-driver ];
        };
      };

      environment.systemPackages = [
        pkgs.framework-tool
        pkgs.fw-ectool
      ];

      assertions = [
        {
          assertion = gpuCfg.driver != "xe" || lib.versionAtLeast kernelVersion "6.8";
          message = "Intel Xe GPU driver is not supported on kernels earlier than 6.8. Update or use the i915 driver.";
        }
      ];
    }

    (lib.mkIf config.hardware.framework.enableKmod {
      assertions = [
        {
          assertion = lib.versionAtLeast kernelVersion "6.10";
          message = "The framework laptop kernel module requires Linux 6.10 or above";
        }
      ];

      boot = {
        extraModulePackages = [ config.boot.kernelPackages.framework-laptop-kmod ];
        kernelModules = [
          "cros_ec"
          "cros_ec_lpcs"
        ];
      };
    })
  ];
}
