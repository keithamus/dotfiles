#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" "$(basename $(dirname $0))"

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

mkdir -p "$HOME/.config/nvim/"
ln -sf "$THISDIR/nvim.vim" "$HOME/.config/nvim/init.vim"

nvim --headless +PlugInstall +qa
