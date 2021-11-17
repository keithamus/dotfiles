#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" $0

THISDIR=$(cd "$(dirname "$0")"; pwd)

curl -s https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info > /tmp/alacritty.info
sudo tic -xe alacritty,alacritty-direct /tmp/alacritty.info
