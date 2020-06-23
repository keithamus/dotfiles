#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
BREWFILE="$THISDIR/Brewfile"

if [ "$(uname -s)" = "Darwin" ]
then

  ./homebrew/install.sh
  brew bundle install --file="$BREWFILE"

elif [ "$(uname -s)" = "Linux" -a "$GDMSESSION" = "pop" ]
then

  sudo apt install -qq -y --no-install-recommends \
    colordiff \
    direnv \
    entr \
    ffmpeg \
    fish \
    fzf \
    gifsicle \
    gnupg \
    graphicsmagick \
    httpie \
    hub \
    imagemagick \
    jq \
    lcov \
    ncdu \
    neovim \
    netcat \
    nmap \
    openssl \
    pngcrush \
    prettyping \
    protobuf-compiler \
    ranger \
    rename \
    ripgrep \
    shellcheck \
    sqlite \
    tidy \
    tldr \
    tmux \
    tree \
    watch \
    wdiff \
    webp \
    webp \
    wget \
    youtube-dl \
    zopfli

fi
