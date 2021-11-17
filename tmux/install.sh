#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" $0

THISDIR=$(cd "$(dirname "$0")"; pwd)
ln -sf "${THISDIR}/tmux.conf"  ~/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
