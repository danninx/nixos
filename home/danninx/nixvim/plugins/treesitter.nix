{ config, ... }:
let
  grammars = config.plugins.treesitter.package.builtGrammars;
in
{
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;

    grammarPackages = with grammars; [
      bash
      c
      cpp
      go
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
