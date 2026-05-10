{ ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "dockerfile"
      "docker-compose"
      "golangci-lint"
      "html"
      "make"
      "material-icon-theme"
      "nix"
      "tokyo-night-themes"
      "toml"
    ];

    userSettings = {
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      features = {
        copilot = false;
      };

      load_direnv = "direct";
      vim_mode = true;
      icon_theme = "Material Icon Theme";
      ui_font_size = 16;
      buffer_font_size = 15;

      theme = {
        mode = "dark";
        light = "One Light";
        dark = "Tokyo Night";
      };

      direnv = "shell_hook";
    };
  };
}
