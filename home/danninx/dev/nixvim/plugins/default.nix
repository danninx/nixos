{ ... }:
{
  imports = [
    ./bufferline.nix
    ./cmp.nix
    ./lsp.nix
    ./mini.nix
    ./oil.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  plugins.nix.enable = true;
}
