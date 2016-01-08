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
git fetch --all --prune --quiet
git checkout origin/master --force --quiet

defaults write com.matryer.BitBar NSNavLastRootDirectory -string "$THISDIR/plugins/enabled"
defaults write com.matryer.BitBar pluginsDirectory -string "$THISDIR/plugins/enabled"

echo "Enabling bitbar plugins"
rm "$THISDIR/plugins/Enabled/"*
enablePlugin Dev/Docker/docker-status.1m.sh
enablePlugin Dev/Homebrew/brew-updates.1h.sh
chmod +x "$THISDIR/plugins/Enabled/"*

killall BitBar
open -a "BitBar"
