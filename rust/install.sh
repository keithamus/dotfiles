#!/usr/bin/env sh
if [ ! -d "$HOME/.multirust" ]
then
  curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh
fi

multirust default stable
mkdir -p ~/.cargo/bin
