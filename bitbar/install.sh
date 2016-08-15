#!/usr/bin/env sh
THISDIR=$(realpath "$(dirname "$0")")
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
git checkout upstream/master --force --quiet
git stash apply 'stash^{/config}'

defaults write com.matryer.BitBar NSNavLastRootDirectory -string "$THISDIR/plugins/enabled"
defaults write com.matryer.BitBar pluginsDirectory -string "$THISDIR/plugins/enabled"

echo "Enabling bitbar plugins"
rm "$THISDIR/plugins/Enabled/"*
enablePlugin Time/pomodoro.1s.sh
enablePlugin Dev/Homebrew/brew-updates.1h.sh
enablePlugin Dev/GitHub/notifications.30s.py
enablePlugin Dev/Travis/travis-check.2m.py
chmod +x "$THISDIR/plugins/Enabled/"*

killall BitBar
open -a "BitBar"
