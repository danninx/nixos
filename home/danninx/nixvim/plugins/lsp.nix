{pkgs, ...}: {
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      golangci_lint_ls.enable = true;
      gopls = {
        enable = true;
        settings = {
          gopls = {
            gofumpt = true;
            codelenses = {
              gc_details = false;
              generate = true;
              regenerate_cgo = true;
              run_govulncheck = true;
              test = true;
              tidy = true;
              upgrade_dependency = true;
              vendor = true;
            };
            hints = {
              assignVariableTypes = false;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariableTypes = true;
            };
            analyses = {
              nilness = true;
              unusedparams = true;
              unusedwrite = true;
              useany = true;
            };
            usePlaceholders = true;
            completeUnimported = true;
            staticcheck = true;
            directoryFilters = [ "-.git" "-.vscode" "-.idea" "-.vscode-test" "-node_modules" ];
            semanticTokens = true;
          };
        };
      };

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

      clangd = {
        enable = true;
      };

      qmlls.enable = true;
    };
  };
}
