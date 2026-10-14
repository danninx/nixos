{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "${./background.png}"
      ];
      wallpaper = [
        {
          monitor = "";
          path = "${./background.png}";
        }
      ];
    };
  };
}
