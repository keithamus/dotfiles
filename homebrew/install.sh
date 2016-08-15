#!/usr/bin/env sh
which brew > /dev/null
if [ "$?" != "0" ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
THISDIR=$(cd "$(dirname "$0")"; pwd)
BREWFILE="$THISDIR/Brewfile"
brew bundle install --file="$BREWFILE"
