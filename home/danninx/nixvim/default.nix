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

    diagonostics.config = {
      virtual_text = {
        spacing = 4;
        source = "if_many";
        prefix = "●";
        severity = {
          max = "vim.diagnostic.severity.WARN";
        };
      };
      virtual_lines = {
        enabled = true;
        severity = {
          min = "vim.diagnostic.severity.ERROR";
        };
      };
      severity_sort = true;
    };

    opts = {
      clipboard = "unnamedplus";
      expandtab = false;
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      softtabstop = 4;
      tabstop = 4;
      termguicolors = true;
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

    imports = [
      ./plugins
    ];

    colorschemes.tokyonight.enable = true;
    colorschemes.tokyonight.settings.transparent = true;
  };
}
