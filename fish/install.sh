#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
FISHOMF="$THISDIR/omf"
FISHFUNCTIONS="$THISDIR/functions"
mkdir -p ~/.config/fish
if [ ! -L ~/.config/fish/functions ] && [ -d ~/.config/fish/functions ]
then
  echo "moving old fish functions folder"
  mv ~/.config/fish/functions ~/.config/fish/functions.old
fi
if [ ! -L ~/.config/omf ] && [ -d ~/.config/omf ]
then
  echo "moving old omf folder"
  mv ~/.config/omf ~/.config/omf.old
fi
ln -nsfF "$FISHFUNCTIONS" ~/.config/fish/
ln -nsfF "$FISHOMF" ~/.config/

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
