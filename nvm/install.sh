#!/usr/bin/env sh
if [ ! -f "$HOME/.nvm/nvm.sh" ]
then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash
fi
source ~/.nvm/nvm.sh

nvm --version

nvm install 0
nvm install 4
nvm install 6

nvm alias lts 4
nvm alias stable 6
nvm alias default stable
nvm use default
