{ ... }:
# I don't really know how you would do the new syntax now...
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "match:class ^(.*)$, idle_inhibit fullscreen"
    ];
  };
}
