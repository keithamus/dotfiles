#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" $0

THISDIR=$(cd "$(dirname "$0")"; pwd)
mkdir -p ~/.config/fish/conf.d
ln -sf "${THISDIR}/fishfile"  ~/.config/fish/fishfile
ln -sf "${THISDIR}/conf.d/"* ~/.config/fish/conf.d/
ln -sf "${THISDIR}/functions/"* ~/.config/fish/functions/

if [ "$(grep -c fish /etc/shells)" = "0" ]
then
  echo "Please enter your password to add fish to available shells"
  echo "$(which fish 2>/dev/null)" | sudo tee -a /etc/shells
fi
chsh -s $(which fish 2>/dev/null)

echo "Installing fisherman"
fish -c 'fisher --version' 2> /dev/null
if [ "$?" != "0" ]
then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fi
fish -c 'fisher'
