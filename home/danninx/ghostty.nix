{ ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "TokyoNight";
      font-family = "JetBrainsMono Nerd Font Mono";
      mouse-hide-while-typing = true;

      shell-integration = "zsh";

      window-padding-x = 10;
      window-padding-y = 10;

      window-save-state = "never";
      confirm-close-surface = false;

      custom-shader = "${./cursor_sweep.glsl}";
      custom-shader-animation = true;
    };
  };
  home.file.".config/ghostty/shaders/cursor_sweep.glsl".source = ./cursor_sweep.glsl;
}
