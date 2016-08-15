#!/usr/bin/env sh
THISDIR=$(realpath "$(dirname "$0")")
TODOCONF_DIR="$HOME/.todo"
ACTION_DIR="$TODOCONF_DIR/todo.actions.d"
ln -sf "$THISDIR/todo-config.sh" "$HOME/.todo.cfg"
mkdir -p "$ACTION_DIR"

addAddon() {
  ADDON_DIR="$ACTION_DIR/$1"
  if [ ! -d "$ADDON_DIR" ]
  then
    git clone "$2" "$ADDON_DIR"
  fi
  cd "$ADDON_DIR" || exit 1
  git remote add upstream "$2" 2> /dev/null
  git fetch --all --prune --quiet
  git stash save 'config' 2> /dev/null > /dev/null
  SAVED=$?
  git checkout upstream/master --force --quiet
  [ "$SAVED" = "0" ] && git stash apply 'stash^{/config}' 2> /dev/null
  echo "Installed $0 addon"
}

addAddon graph https://github.com/timpulver/todo.txt-graph.git
