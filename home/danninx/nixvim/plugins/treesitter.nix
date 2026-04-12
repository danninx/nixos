{config, ...}: let
  grammars = config.plugins.treesitter.package.builtGrammars;
in {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;

    grammarPackages = with grammars; [
      bash
      c
      cpp
      golang
      help
      make
      markdown
      markdown_inline
      nix
      rust
      typescript
      yaml
    ];
  };
}
