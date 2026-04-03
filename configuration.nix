{ config, pkgs, ... }:

{
	imports =
		[ 
		./hardware-configuration.nix
		];

	boot.loader = {
		efi.canTouchEfiVariables = true;
		efi.efiSysMountPoint = "/boot";
		grub = {
			configurationLimit = 8;
			devices = [ "nodev" ];
			efiSupport = true;
			enable = true;
			extraConfig = ''
			function load_video {
				if [ x$grub_platform = xefi ]; then
					insmod efi_gop
					insmod efi_uga
					elif [ x$feature_all_video_module = xy ]; then
					insmod all_video
				else
					insmod efi_gop
					insmod efi_uga
					insmod ieee1275_fb
					insmod vbe
					insmod vga
					insmod video_bochs
					insmod video_cirrus
				fi
			}
			'';
			extraEntriesBeforeNixOS = false;
			extraEntries = ''
			menuentry "Reboot" {
				reboot
			}
			menuentry "Poweroff" {
				halt
			}
			menuentry 'Arch Linux' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-9f6d1156-cd9b-447a-8e75-19a3833f8f9a' {
				load_video
				set gfxpayload=keep
				insmod gzio
				insmod part_gpt
				insmod fat
				search --no-floppy --fs-uuid --set=root 0FBC-D879
				echo	'Loading Linux linux ...'
				linux	/vmlinuz-linux root=UUID=9f6d1156-cd9b-447a-8e75-19a3833f8f9a rw zswap.enabled=0 rootfstype=ext4 loglevel=3 quiet nvidia-drm.modeset=1
				echo	'Loading initial ramdisk ...'
				initrd	/intel-ucode.img /initramfs-linux.img
			}
			submenu 'Advanced options for Arch Linux' $menuentry_id_option 'gnulinux-advanced-9f6d1156-cd9b-447a-8e75-19a3833f8f9a' {
				menuentry 'Arch Linux, with Linux linux' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-linux-advanced-9f6d1156-cd9b-447a-8e75-19a3833f8f9a' {
					load_video
					set gfxpayload=keep
					insmod gzio
					insmod part_gpt
					insmod fat
					search --no-floppy --fs-uuid --set=root 0FBC-D879
					echo	'Loading Linux linux ...'
					linux	/vmlinuz-linux root=UUID=9f6d1156-cd9b-447a-8e75-19a3833f8f9a rw zswap.enabled=0 rootfstype=ext4 loglevel=3 quiet nvidia-drm.modeset=1
					echo	'Loading initial ramdisk ...'
					initrd	/intel-ucode.img /initramfs-linux.img
				}
			}
			'';
			useOSProber = false;
		};
	};

	
  # Nvidia configuration
  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = true;
    };

    open = true;

    nvidiaSettings = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

	boot.kernelPackages = pkgs.linuxPackages_latest;
	networking.hostName = "amara"; 
	networking.networkmanager.enable = true;

	time.timeZone = "America/Chicago";

	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	users.users.danninx = {
		isNormalUser = true;
		description = "danninx";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [ git neovim ];
	};

	nix.settings.experimental-features = [
		"flakes"
		"nix-command"
	];

	nixpkgs.config = {
		allowUnfree = true;
	};

	programs.hyprland.enable = true;
	environment.systemPackages = with pkgs; [
		neovim
		kitty
		ghostty
	];

	system.stateVersion = "25.11";
}
