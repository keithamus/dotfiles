#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
BREWFILE="$THISDIR/Brewfile"

if [ "$(uname -s)" = "Darwin" ]
then
  ./homebrew/install.sh
  brew bundle install --file="$BREWFILE"
elif [ "$(uname -s)" = "Linux" -a "$GDMSESSION" = "pop" ]
then
  sudo apt install -qq -y --no-install-recommends tmux
fi

ln -sf "${THISDIR}/tmux.conf"  ~/.tmux.conf
