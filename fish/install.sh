#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" "$0"

THISDIR=$(cd "$(dirname "$0")" || exit 1; pwd)
mkdir -p ~/.config/fish/conf.d
ln -sf "${THISDIR}/fishfile"  ~/.config/fish/fishfile
ln -sf "${THISDIR}/conf.d/"* ~/.config/fish/conf.d/
ln -sf "${THISDIR}/functions/"* ~/.config/fish/functions/
FISH="$(which fish 2>/dev/null)"

if [ "$(grep -c fish /etc/shells)" = "0" ]
then
  echo "Please enter your password to add fish to available shells"
  echo $FISH | sudo tee -a /etc/shells
fi

if [ "$SHELL" != "$FISH" ]; then
  echo "Changing shell"
  chsh -s "$(which fish 2>/dev/null)"
fi

if ! fish -c 'fisher --version' 2> /dev/null; then
  echo "Installing fisherman"
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fi

fish -c 'fisher update'
