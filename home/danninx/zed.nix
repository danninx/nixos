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

      tabs = {
        file_icons = true;
        git_status = false;
      };

      tab_bar = {
        show_pinned_tabs_in_separate_row = false;
        show_nav_history_buttons = false;
        show_tab_bar_buttons = false;
        show = true;
      };

      title_bar = {
        show_onboarding_banner = false;
        show_user_picture = false;
        show_user_menu = false;
        show_sign_in = false;
        show_project_items = true;
      };
    };
  };
}
