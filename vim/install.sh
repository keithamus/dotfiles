#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")" || exit; pwd)
VIM_DIR="$HOME/.vim"
if [ ! -L ~/.vim ] && [ -d ~/.vim ]
then
  echo "moving old vim folder"
  mv "$VIM_DIR" "${VIM_DIR}.old"
fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew tap caskroom/fonts
brew cask install font-hack-nerd-font

mkdir -p "$HOME/.config/nvim/"
ln -sf "$THISDIR/nvim.vim" "$HOME/.config/nvim/init.vim"
