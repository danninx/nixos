{...}: let
  font = "JetBrainsMono Nerd Font Bold";
  background = "rgb(1a1b26)";
  darker = "rgb(16161e)";
  foreground = "rgb(a9b1d6)";
  orange = "rgb(e0af68)";
  red = "rgb(f7768e)";
  red_tran = "rgba(f7768e55)";
  purple = "rgb(bb9af7)";
  purple_tran = "rgba(bb9af755)";
  transparent = "rgba(0, 0, 0, 0)";
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          monitor = "";
          blur_passes = 0;
          color = background;
        }
      ];

      general = {
        no_fade_in = false;
        no_fade_out = false;
        hide_cursor = true;
        grace = 0;
        disable_loading_bar = true;
      };

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = foreground;
          font_size = 80;
          font_family = font;
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "400, 60";
          outline_thickness = 1;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          fade_on_empty = false;
          placeholder_text = "[ Logged in as <b>$USER</b> ]";
          hide_input = false;
          fail_text = "<i>[ Try again ]</i>";
          font_family = font;
          position = "0, -100";
          halign = "center";
          valign = "center";
          outer_color = transparent;
          inner_color = transparent;
          font_color = foreground;
          fail_color = red;
          check_color = foreground;
          capslock_color = orange;
        }
      ];
    };
  };
}
