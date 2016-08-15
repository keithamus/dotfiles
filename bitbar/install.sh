#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
enablePlugin() {
  local PLUGIN
  local PLUGIN_NAME
  PLUGIN="$THISDIR/plugins/$1"
  PLUGIN_NAME=$(basename "$PLUGIN")
  ln -sf "$PLUGIN" "$THISDIR/plugins/Enabled/$PLUGIN_NAME"
}

if [ ! -d "$THISDIR/plugins" ]
then
  git clone https://github.com/matryer/bitbar-plugins.git "$THISDIR/plugins"
fi
cd "$THISDIR/plugins" || exit 1
git remote add upstream https://github.com/matryer/bitbar-plugins.git
git fetch --all --prune --quiet
git stash save 'config'
STASHED=$?
git checkout upstream/master --force --quiet
[ -z $STASHED ] && git stash apply 'stash^{/config}'

defaults write com.matryer.BitBar NSNavLastRootDirectory -string "$THISDIR/plugins/enabled"
defaults write com.matryer.BitBar pluginsDirectory -string "$THISDIR/plugins/enabled"

echo "Enabling bitbar plugins"
rm "$THISDIR/plugins/Enabled/"* 2&> /dev/null
enablePlugin Dev/package_manager.7h.sh
enablePlugin Dev/GitHub/notifications.30s.py
enablePlugin Dev/Travis/travis-check.2m.py
chmod +x "$THISDIR/plugins/Enabled/"*

killall BitBar
open -a "BitBar"
