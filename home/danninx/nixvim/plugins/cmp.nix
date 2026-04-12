{...}: {
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        settings = {
          appearance = {
            nerd_font_variant = "mono";
            use_nvim_cmp_as_default = true;
          };

          completion = {
            accept = {
              auto_brackets = {
                enabled = true;
                semantic_token_resolution.enable = true;
              };
            };
            documentation.auto_show = true;
          };

          keymap = {
            preset = "enter";
          };

          fuzzy.implementation = "prefer_rust_with_warning";
          signature.enabled = true;
          sources.default = ["lsp" "path" "snippets" "buffer"];
        };
      };

      friendly-snippets.enable = true;
    };
  };
}
