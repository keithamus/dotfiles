#!/usr/bin/env sh
THISDIR=$(realpath "$(dirname "$0")")
FISHOMF="$(realpath "$THISDIR/omf")"
FISHFUNCTIONS="$(realpath "$THISDIR/functions")"
mkdir -p ~/.config/fish
ln -nsf "$FISHFUNCTIONS" ~/.config/fish/functions
ln -nsf "$FISHOMF" ~/.config/omf

if [ "$(grep fish /etc/shells | wc -l)" = "0" ]
then
  echo "Please enter your password to add fish to available shells"
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/fish

echo "Installing oh-my-fish"
fish -c 'omf --version' 2> /dev/null
if [ "$?" != "0" ]
then
  curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
fi
fish -c 'omf install'
