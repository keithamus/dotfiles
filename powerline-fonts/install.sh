#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
git clone git@github.com:powerline/fonts.git "$THISDIR/powerline"
sh "$THISDIR/powerline/install.sh"

installFont() {
  version="2.1.0"
  wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/$1.zip"
  unzip -u "$1.zip" -d ~/.fonts
  rm "$1.zip"
}

# Nerd Fonts Too!
if [ "$(uname -s)" = "Darwin" ]
then
  ./homebrew/install.sh
  brew bundle install --file="$BREWFILE"
elif [ "$(uname -s)" = "Linux" -a "$GDMSESSION" = "pop" ]
then
  installFont "AnonymousPro"
  installFont "FiraCode"
  installFont "Hack"
  installFont "Inconsolata"
  installFont "Meslo"
  installFont "SourceCodePro"
  fc-cache -fv
fi
