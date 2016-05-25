#!/usr/bin/env sh
SCRIPT_ROOT="$(dirname "$0")"
installScript() {
  printf "Install %s? (Y/n) " "$1"
  read -r REPLY
  echo
  if [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ] || [ "$REPLY" = "" ]
  then
    echo "###"
    echo "# Installing $1"
    echo "###"
    sh "$SCRIPT_ROOT/$2/install.sh"
  fi
}

if [ "$(uname -s)" = "Darwin" ]
then
  installScript "Homebrew" homebrew
  installScript "OSX tweaks" osx
  installScript "BitBar" bitbar
  #installScript "Mjolnir" mjolnir
  installScript "Hammerspoon" hammerspoon
fi

installScript "Git" git
installScript "Docker" docker
installScript "Fish" fish
installScript "Node" nvm
installScript "Rust" rust
installScript "Todo" todo
