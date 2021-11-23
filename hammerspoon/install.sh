#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" "$0"

brew cask install hammerspoon
THISDIR=$(cd "$(dirname "$0")" || exit 1; pwd)
HOME_HAMMERSPOON="$HOME/.hammerspoon"
THIS_HAMMERSPOON="$THISDIR/config"
echo "› Linking $THISDIR and $MJOLNIRDIR..."
ln -nsf "$THIS_HAMMERSPOON" "$HOME_HAMMERSPOON"
killall Hammerspoon
open -a "Hammerspoon"
