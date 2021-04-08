#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" "$(basename $(dirname $0))"

if [ ! -f "$HOME/.nvm/nvm.sh" ]
then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash
fi
source ~/.nvm/nvm.sh

nvm --version

nvm install 12
nvm install 10

nvm alias lts 10
nvm alias stable 12
nvm alias default stable
nvm use default
