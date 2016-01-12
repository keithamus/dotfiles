#!/usr/bin/env sh
THISDIR=$(realpath "$(dirname "$0")")
FISHOMF="$(realpath "$THISDIR/omf")"
FISHFUNCTIONS="$(realpath "$THISDIR/functions")"
mkdir -p ~/.config/fish
if [ -d ~/.config/fish/functions ]
then
  mv ~/.config/fish/functions ~/.config/fish/functions.old
fi
if [ -d ~/.config/omf ]
then
  mv ~/.config/omf ~/.config/omf.old
fi
ln -nsfF "$FISHFUNCTIONS" ~/.config/fish/functions
ln -nsfF "$FISHOMF" ~/.config/omf

if [ "$(grep -c fish /etc/shells)" = "0" ]
then
  echo "Please enter your password to add fish to available shells"
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/fish
fi

echo "Installing oh-my-fish"
fish -c 'omf --version' 2> /dev/null
if [ "$?" != "0" ]
then
  curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
fi
fish -c 'omf install'