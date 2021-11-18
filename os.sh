#!/usr/bin/env sh
set -Eeu
OS=""
if [ -f /etc/lsb-release ]; then
  . /etc/lsb-release
  OS="${DISTRIB_ID,Ubuntu}"
elif [ "$(uname -s)" = "Darwin" ]; then
  OS="macos"
fi 
case "$(uname -n)" in codespace*)
  OS="codespace"
  ;;
esac
echo "$OS"
