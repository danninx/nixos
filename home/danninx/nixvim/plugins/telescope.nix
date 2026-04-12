{...}: {
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      undo.enable = true;
      live-grep-args.enable = true;
    };

    keymaps = {
      "<leader>pf" = {
        action = "find_files";
        options.desc = "find files by name";
      };
      "<leader>pg" = {
        action = "live_grep";
        options.desc = "find files by contents";
      };
    };

    settings = {
      pickers.find_files.hidden = true;
      defaults.file_ignore_patterns = [
        "^.git/"
        "^node_modules/"
      ];
    };
  };
}
