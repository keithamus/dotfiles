#!/usr/bin/env sh
echo 'rocks_servers = { "http://rocks.moonscript.org" }' >> /usr/local/etc/luarocks52/config-5.2.lua
brew cask install mjolnir
brew install lua
luarocks install mjolnir.alert
luarocks install mjolnir.hotkey
luarocks install mjolnir.application
MJOLNIRDIR="$HOME/.mjolnir"
THISDIR=$(realpath "$(dirname "$0")")
echo "› Linking $THISDIR and $MJOLNIRDIR..."
ln -nsf $THISDIR $MJOLNIRDIR
killall Mjolnir
open -a "Mjolnir"
