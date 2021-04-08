#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" "$(basename $(dirname $0))"

ln -sf "${THISDIR}/tmux.conf"  ~/.tmux.conf
