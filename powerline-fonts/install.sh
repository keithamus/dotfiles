#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
git clone git@github.com:powerline/fonts.git "$THISDIR/powerline"
sh "$THISDIR/powerline/install.sh"
