#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" $0

if [ "$(which apt 2>/dev/null)"]; then
  # Git-Delta
  wget https://github.com/dandavison/delta/releases/download/0.1.1/git-delta_0.1.1_amd64.deb
  sudo dpkg --skip-same-version -i git-delta_0.1.1_amd64.deb
  rm -f git-delta_0.1.1_amd64.deb
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

GPG_ID=$(gpg --list-secret-keys --keyid-format LONG $GITEMAIL | head -1 | awk '{print $2}' | awk -F '/' '{print $2}')
if [ "$GPG_ID" ]; then
  git config --global user.signingkey $GPG_ID
fi

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
