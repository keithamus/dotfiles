if test $TERM != "screen"; and test "$TMUX" = ""; and test -t 0; and test "$TERM_PROGRAM" != "vscode"
  tmux -u attach || tmux -u
end
