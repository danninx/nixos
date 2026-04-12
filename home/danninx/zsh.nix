{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      ignoreDups = true;
      save = 10000;
      size = 10000;
      share = true;
    };

    initContent = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
    '';

    shellAliases = {
      grep = "grep --color=tty";
      home = "cd ~ && clear";
      la = "ls -alh --color=tty";
      ll = "ls -l --color=tty";
      ls = "ls --color=tty";
      mkcd = "func() { mkdir -p \"$1\" && cd \"$1\"; }; func";
    };
  };
}
