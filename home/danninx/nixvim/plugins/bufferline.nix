{
  config,
  lib,
  ...
}: {
  plugins.bufferline = {
    enable = true;

    settings = {
      options = {
        separator_style = "thin";
        themable = true;
        diagnostics = "nvim_lsp";
      };

      highlights = {
        background = {bg = "none";};
        fill = {bg = "none";};
      };
    };
  };

  keymaps = lib.mkIf config.plugins.bufferline.enable [
    {
      mode = "n";
      key = "<M-t>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Next buffer";
      };
    }
    {
      mode = "n";
      key = "<S-t>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Previous buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>do";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "[D]ump [o]ther buffers";
      };
    }
  ];
}
