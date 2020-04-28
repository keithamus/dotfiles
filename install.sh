#!/usr/bin/env sh
SCRIPT_ROOT=$(cd "$(dirname "$0")" || exit 1; pwd)
if [ -f "$SCRIPT_ROOT/setup" ]; then
  SCRIPT_ROOT="$(dirname "${SCRIPT_ROOT}")"
fi
echo $SCRIPT_ROOT
installScript() {
  echo "###"
  echo "# Installing $1"
  echo "###"
  sh "$SCRIPT_ROOT/$2/install.sh"
}

if [ "$(uname -s)" = "Darwin" ]
then
  installScript "Homebrew" homebrew
  installScript "OSX tweaks" osx
  installScript "Hammerspoon" hammerspoon
fi

installScript "Git" git
installScript "SSH" ssh
installScript "Powerline Fonts" powerline-fonts
installScript "Fish" fish
installScript "Node" nvm
installScript "Rust" rust
installScript "Todo" todo
installScript "VIM" vim
