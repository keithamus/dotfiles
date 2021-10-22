#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" $0

THISDIR=$(cd "$(dirname "$0")"; pwd)
git clone git@github.com:powerline/fonts.git "$THISDIR/powerline"
sh "$THISDIR/powerline/install.sh"

installFont() {
  version="2.1.0"
  wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/$1.zip"
  mkdir -p ~/.fonts
  unzip -u "$1.zip" -d ~/.fonts
  rm "$1.zip"
}
installFont "AnonymousPro"
installFont "FiraCode"
installFont "Hack"
installFont "Inter"
installFont "Inconsolata"
installFont "Meslo"
installFont "SourceCodePro"

if [ "$(which fc-cache 2>/dev/null)" ]; then
  fc-cache -fv
fi
