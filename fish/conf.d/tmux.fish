if test $TERM != "screen"; and test "$TMUX" = ""
  tmux -u attach || tmux -u
end
