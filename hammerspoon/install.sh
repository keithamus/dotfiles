#!/usr/bin/env sh
brew cask install hammerspoon
THISDIR=$(realpath "$(dirname "$0")")
HOME_HAMMERSPOON="$HOME/.hammerspoon"
THIS_HAMMERSPOON="$THISDIR/config"
echo "› Linking $THISDIR and $MJOLNIRDIR..."
ln -nsf $THIS_HAMMERSPOON $HOME_HAMMERSPOON
killall Hammerspoon
open -a "Hammerspoon"
