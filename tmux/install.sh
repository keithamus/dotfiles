#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" "$(basename $(dirname $0))"

THISDIR=$(cd "$(dirname "$0")"; pwd)
ln -sf "${THISDIR}/tmux.conf"  ~/.tmux.conf
