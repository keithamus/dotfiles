if test $TERM != "screen"; and test "$TMUX" = ""; and test -t 0
  tmux -u attach || tmux -u
end
