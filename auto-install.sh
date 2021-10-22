#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
OS="$($THISDIR/os.sh)"
DIR="$(cd $(dirname ${1-}); pwd)"

if [ -f "$DIR/Brewfile" ] && [ "$OS" = "macos" ]; then
  "$THISDIR/homebrew/install.sh"
  brew bundle install --file="$DIR/Brewfile"
elif [ -f "$DIR/Debfile" ] && [ "$(which apt 2>/dev/null)"]; then
  xargs -a "$THISDIR/Debfile" sudo apt install -qq -y --no-install-recommends
elif [ -f "$DIR/Yayfile" ] && [ "$(which pacman 2>/dev/null)" ]; then
  sudo pacman --noconfirm --needed -Syu yay
  yes | xargs -a "$DIR/Yayfile" yay --needed --answerclean No --answerdiff N -S --noprovides
fi
