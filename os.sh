#!/usr/bin/env sh
set -Eeuo pipefail
OS=""
if [ -f /etc/lsb-release ]; then
  . /etc/lsb-release
  OS="${DISTRIB_ID,Ubuntu}"
elif [ "$(uname -s)" = "Darwin" ]; then
  OS="macos"
fi 
if [ "$(id -u -n)" = "codespace" ]; then
  OS="codespace"
fi
echo "$OS"
