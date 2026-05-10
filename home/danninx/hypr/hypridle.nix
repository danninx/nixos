{ ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 240;
          on-timeout = "ddcutil setvcp 10 10";
          on-resume = "ddcutil setvcp 10 100";
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
          on-resume = "ddcutil setvcp 10 100";
        }
        {
          timeout = 450;
          on-timeout = "hyprctl dispatch dpms off";
          one-resume = "hyprctl dispatch dpms on && ddcutil setvcp 10 100";
        }
      ];
    };
  };
}
