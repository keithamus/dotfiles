#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" "$(basename $(dirname $0))"

THISDIR=$(cd "$(dirname "$0")"; pwd)

mkdir -p ~/.config/alacritty
ln -sf "${THISDIR}/alacritty.yml"  ~/.config/alacritty/alacritty.yml
