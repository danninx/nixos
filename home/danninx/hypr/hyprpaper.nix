{ ... }:

{
	services.hyprpaper = {
		enable = true;
		preload = [
			./background.png
		];
		wallpaper = [{
			monitor = "";
			path = ./background.png;
		}];
	}
}
