{ ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "astro"
      "ansible"
      "discord-presence"
      "dockerfile"
      "docker-compose"
      "golangci-lint"
      "html"
      "ini"
      "make"
      "material-icon-theme"
      "nix"
      "opentofu"
      "tokyo-night"
      "toml"
    ];

    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          cmd-g = [
            "task::Spawn"
            {
              task_name = "lazygit";
              reveal_target = "center";
            }
          ];
        };
      }
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

      file_types = {
        Ansible = [
          "**.ansible.yml"
          "**.ansible.yaml"
          "**/defaults/*.yml"
          "**/defaults/*.yaml"
          "**/meta/*.yml"
          "**/meta/*.yaml"
          "**/tasks/*.yml"
          "**/tasks/*.yaml"
          "**/handlers/*.yml"
          "**/handlers/*.yaml"
          "**/group_vars/*.yml"
          "**/group_vars/*.yaml"
          "**/playbooks/*.yaml"
          "**/playbooks/*.yml"
          "**playbook*.yaml"
          "**playbook*.yml"
        ];
      };
    };

    userTasks = [
      {
        label = "lazygit";
        command = "lazygit";
        hide = "on_success";
        reveal_target = "center";
        show_summary = false;
        show_command = false;
        allow_concurrent_runs = true;
      }
    ];
  };
}
