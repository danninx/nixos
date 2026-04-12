{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    extraPackages = with pkgs; [alejandra];
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";

    clipboard = {
      providers.wl-copy.enable = true;
    };

    opts = {
      clipboard = "unnamedplus";
      shiftwidth = 4;
      tabstop = 4;
      number = true;
    };

    keymaps = [
      (lib.mkIf (!config.programs.nixvim.plugins.oil.enable) {
        mode = ["n"];
        key = "<leader>pv";
        action = "<cmd>Ex<CR>";
        options.desc = "Enter file explorer";
      })
      {
        mode = ["n"];
        key = "<leader>n";
        action = "gg=G<C-o>";
        options.desc = "Quick i[n]dent file";
      }
      {
        mode = ["n"];
        key = "<leader>c";
        action = "<cmd>%y<CR>";
        options.desc = "[c]opy file";
      }
      {
        mode = ["n"];
        key = "<leader>re";
        action = "<cmd>e!<CR>";
        options.desc = "[r]evert [e]dits";
      }
    ];

    colorschemes.tokyonight.enable = true;
    colorschemes.tokyonight.settings.transparent = true;

    plugins.nix.enable = true;
    plugins.web-devicons.enable = true;
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

    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "nvim_lsp_signature_help";}
          ];
          mapping = {
            "<Tab>" =
              # Lua
              "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
            "<S-Tab>" =
              # Lua
              "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
            "<CR>" =
              # Lua
              "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
          };
        };
      };
    };

    plugins.lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nil_ls = {
          enable = true;
          package = pkgs.nil;
          settings = {
            formatting.command = ["alejandra"];
            cmd = [pkgs.nil];
            nix = {
              flake = {
                autoArchive = true;
                autoEvalInputs = null;
              };
            };
          };
        };
      };
    };
  };
}
