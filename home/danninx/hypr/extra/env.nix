{ ... }:

{
	xdg.configFile."uwsm/env".text = ''
		export XCURSOR_SIZE=24
		export HYPRCURSOR_THEME=BreezeX-RosePine-Linux
		export HYPRCURSOR_SIZE=24
		export LIBVA_DRIVER_NAME=nvidia
		export __GLX_VENDOR_LIBRARY_NAME=nvidia
		export ELECTRON_OZONE_PLATFORM=auto
		'';
}
