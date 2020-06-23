#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
BREWFILE="$THISDIR/Brewfile"

if [ "$(uname -s)" = "Darwin" ]
then
  ./homebrew/install.sh
  brew bundle install --file="$BREWFILE"
elif [ "$(uname -s)" = "Linux" -a "$GDMSESSION" = "pop" ]
then
  sudo apt install -qq -y --no-install-recommends git tig
fi

GITEDITOR="$(git config --global core.editor)"
GITNAME="$(git config --global user.name)"
GITEMAIL="$(git config --global user.email)"
THISDIR=$(cd "$(dirname "$0")"; pwd)
GITCONFIG="$THISDIR/gitconfig"
TIGCONFIG="$THISDIR/tigrc"


mkdir -p ~/.config/git
git config --global core.editor "${GITEDITOR:-nvim}"
git config --global user.name "${GITNAME:-Keith Cirkel}"
git config --global user.email "${GITEMAIL:-keithamus@users.noreply.github.com}"
git config --global include.path "$GITCONFIG"

USERTIGCONFIG="$HOME/.tigrc"
TIGRCFILES="$THISDIR/tigrc.d"
if [ ! -f "$USERTIGCONFIG" ];
then
  touch "$USERTIGCONFIG"
fi
for f in "$TIGRCFILES"/*;
do
  if ! grep -q "source $f" "$USERTIGCONFIG"
  then
    echo "source $f" >> "$USERTIGCONFIG";
  fi
done
