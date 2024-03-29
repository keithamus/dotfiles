#!/usr/bin/env sh
SCRIPT_ROOT=$(cd "$(dirname "$0")" || exit 1; pwd)
if [ -d "$SCRIPT_ROOT/setup" ]; then
  SCRIPT_ROOT="$(dirname "${SCRIPT_ROOT}")"
fi
OS=$(${SCRIPT_ROOT}/os.sh)

echo "########################################"
echo "# Running keithamus dotfiles installer"
echo "# \`$SCRIPT_ROOT/install.sh\`"
echo "########################################"

installScript() {
  echo "###"
  echo "# Installing $1"
  echo "###"
  sh "$SCRIPT_ROOT/$2/${3:-install}.sh"
}

cat >> ~/.ssh/known_hosts <<EOF
github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
EOF

if [ "$OS" = "macos" ]; then
  "$THISDIR/homebrew/install.sh"
  brew upgrade && brew upgrade
elif [ -f "$DIR/Debfile" ] && [ "$(which apt 2>/dev/null)" ]; then
  sudo apt update && sudo apt upgrade -y
elif [ -f "$DIR/Yayfile" ] && [ "$(which pacman 2>/dev/null)" ]; then
  if ! which yay >/dev/null 2>&1; then
    sudo pacman --noconfirm --needed -S yay
  fi
  yes | yay --answerclean No --answerdiff N --noprovides -Syu
fi

if [ "$OS" != "codespace" ]; then
  installScript "Alacritty" alacritty
else
  installScript "Alacritty" alacritty install-terminfo
fi

if [ "$OS" != "codespace" ]; then
  installScript "Desktop Apps" desktop-apps
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
