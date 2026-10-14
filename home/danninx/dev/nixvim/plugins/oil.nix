{
  config,
  lib,
  ...
}:
{
  plugins.oil = {
    enable = true;

    settings = {
      default_file_explorer = true;
      delete_to_trash = false;
      skip_confirm_for_simple_edits = true;
      use_default_keymaps = true;

      float = {
        padding = 2;
        max_width = 0;
        max_height = 0;
        border = "nil";
      };

      keymaps = {
        "q" = "actions.close";
      };

      view_options = {
        show_hidden = true;
      };
    };
  };

  keymaps = lib.mkIf config.plugins.oil.enable [
    {
      mode = [ "n" ];
      key = "<leader>pv";
      action = "<cmd>Oil<CR>";
      options.desc = "Enter oil explorer";
      options.silent = true;
    }
  ];
}
