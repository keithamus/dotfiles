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
  
  # Git-Delta
  wget https://github.com/dandavison/delta/releases/download/0.1.1/git-delta_0.1.1_amd64.deb
  sudo dpkg --skip-same-version -i git-delta_0.1.1_amd64.deb
  rm -f git-delta_0.1.1_amd64.deb

  # Git-Codeowners
  curl -L https://github.com/softprops/git-codeowners/releases/download/v0.1.2/git-codeowners-Linux-x86_64.tar.gz | tar -xz
  mv ./git-codeowners /usr/local/bin

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
