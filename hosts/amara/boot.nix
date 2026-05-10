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
}
