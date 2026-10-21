{ ... }:
{
  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      ignoreDups = true;
      share = true;
      expireDuplicatesFirst = true;
      extended = true;
    };

    initContent = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"

      mkcd() { mkdir -p "$1" && cd "$1"; }
      flakenv() { echo 'use flake' >> .envrc && direnv allow; }
    '';

    shellAliases = {
      grep = "grep --color=tty";
      home = "cd ~ && clear";
      la = "ls -alh --color=tty";
      ll = "ls -l --color=tty";
      ls = "ls --color=tty";
    };
  };
}
