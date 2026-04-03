{ config, lib, pkgs, modulesPath, ... }:

{
	imports = [ 
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

	fileSystems."/" = { 
		device = "/dev/disk/by-uuid/87acf3f8-f9d5-4668-bf4b-5e04ea06f69e";
		fsType = "ext4";
	};

	fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/2777-3B9C";
		fsType = "vfat";
		options = [ "fmask=0077" "dmask=0077" ];
	};

	swapDevices = [ 
		{ device = "/dev/disk/by-uuid/19aba5bb-5db1-4901-9d18-685fd4baf6fb"; }
	];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
