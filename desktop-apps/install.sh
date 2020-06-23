#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
BREWFILE="$THISDIR/Brewfile"

if [ "$(uname -s)" = "Darwin" ]
then

  ../homebrew/install.sh
  brew bundle install --file="$BREWFILE"

elif [ "$(uname -s)" = "Linux" -a "$GDMSESSION" = "pop" ]
then

  flatpak install --user --noninteractive \
  	com.github.alainm23.planner \
  	com.github.tchx84.Flatseal \
  	com.slack.Slack \
  	com.spotify.Client \
  	com.uploadedlobster.peek \
  	com.valvesoftware.Steam \
  	com.valvesoftware.Steam.Utility.MangoHud \
  	org.gnome.Books \
  	org.gnome.Calendar \
  	org.gnome.Contacts \
  	org.gnome.Evolution \
  	org.gnome.Fractal \
  	org.gnome.Maps \
  	org.kde.kdenlive \
  	org.kde.krita \
  	org.telegram.desktop \
  	org.videolan.VLC

fi
