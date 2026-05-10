{ ... }:
{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        appearance = {
          nerd_font_variant = "mono";
        };

        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
              semantic_token_resolution.enable = true;
            };
          };
          list.selection.preselect = true;
          list.selection.auto_insert = true;
          documentation.auto_show = true;
        };

        keymap = {
          preset = "enter";
        };

        fuzzy.implementation = "prefer_rust_with_warning";
        signature.enabled = true;
        sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };
    };

    friendly-snippets.enable = true;
  };
}
