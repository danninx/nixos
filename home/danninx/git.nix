{ ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Daniel Fajardo";
        email = "danielfajardo@pm.me";
      };

      core.whitespace = "trailing-space,space-before-tab";
      init.defaultBranch = "main";
      pull.rebase = true;
      diff.algorithm = "histogram";
      merge.conflictStyle = "zdiff3";
      commit.verbose = true;
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      help.autocorrect = "prompt";
    };
  };

  programs.lazygit.enable = true;
  stylix.targets.lazygit.enable = true;
}
