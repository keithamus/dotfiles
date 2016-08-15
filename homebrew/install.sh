#!/usr/bin/env sh
which brew > /dev/null
if [ "$?" != "0" ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
THISDIR=$(realpath "$(dirname "$0")")
BREWFILE="$(realpath "$THISDIR/Brewfile")"
brew bundle --file="$BREWFILE"
