#!/usr/bin/env sh
CURRENTGITEDITOR="$(git config --global core.editor)"
printf "Editor? (default: $CURRENTGITEDITOR) "
read -r GITEDITOR
if [ "$GITEDITOR" = "" ]
then
  GITEDITOR="$CURRENTGITEDITOR"
fi
CURRENTGITNAME="$(git config --global user.name)"
printf "Name? (default: $CURRENTGITNAME) "
read -r GITNAME
if [ "$GITNAME" = "" ]
then
  GITNAME="$CURRENTGITNAME"
fi
CURRENTGITEMAIL="$(git config --global user.email)"
printf "Email? (default: $CURRENTGITEMAIL) "
read -r GITEMAIL
if [ "$GITEMAIL" = "" ]
then
 GITEMAIL="$CURRENTGITEMAIL"
fi

THISDIR=$(realpath "$(dirname "$0")")
GITCONFIG="$(realpath $THISDIR/gitconfig)"

mkdir -p ~/.config/git
git config --global core.editor "$GITEDITOR"
git config --global user.name "$GITNAME"
git config --global user.email "$GITEMAIL"
git config --global include.path "$GITCONFIG"