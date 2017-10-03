#!/usr/bin/env sh
SCRIPT_ROOT="$(dirname "$0")"
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
  installScript "BitBar" bitbar
  installScript "Hammerspoon" hammerspoon
fi

installScript "Git" git
installScript "Powerline Fonts" powerline-fonts
installScript "Fish" fish
installScript "Node" nvm
installScript "Rust" rust
installScript "Todo" todo
installScript "VIM" vim
