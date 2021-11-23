#!/usr/bin/env sh
SCRIPT_ROOT=$(cd "$(dirname "$0")" || exit 1; pwd)
if [ -d "$SCRIPT_ROOT/setup" ]; then
  SCRIPT_ROOT="$(dirname "${SCRIPT_ROOT}")"
fi
OS=$(./os.sh)

echo "########################################"
echo "# Running keithamus dotfiles installer"
echo "# \`$SCRIPT_ROOT/install.sh\`"
echo "########################################"

installScript() {
  echo "###"
  echo "# Installing $1"
  echo "###"
  sh "$SCRIPT_ROOT/$2/install.sh"
}

if [ "$OS" != "codespace" ]; then
  installScript "Desktop Apps" desktop-apps
fi

if [ "$OS" != "codespace" ]; then
  installScript "1Password" op
  installScript "SSH" ssh
  installScript "GPG" gpg
fi

installScript "Git" git
installScript "CLI Tools" cli-tools

installScript "ASDF" asdf
installScript "Fish" fish
installScript "Powerline Fonts" powerline-fonts
installScript "VIM" vim
installScript "Tmux" tmux
