{pkgs, ...}: {
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
}
