#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
mkdir -p ~/.config/fish/conf.d
ln -sf "${THISDIR}/fishfile"  ~/.config/fish/fishfile
ln -sf "${THISDIR}/conf.d/"* ~/.config/fish/conf.d/

if [ "$(grep -c fish /etc/shells)" = "0" ]
then
  echo "Please enter your password to add fish to available shells"
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/fish
fi

echo "Installing fisherman"
fish -c 'fisher --version' 2> /dev/null
if [ "$?" != "0" ]
then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fi
fish -c 'fisher'
