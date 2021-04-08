#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" "$(basename $(dirname $0))"

THISDIR=$(cd "$(dirname "$0")"; pwd)
TODOCONF_DIR="$HOME/.todo"
ACTION_DIR="$TODOCONF_DIR/todo.actions.d"
ln -sf "$THISDIR/todo-config.sh" "$HOME/.todo.cfg"
mkdir -p "$ACTION_DIR"

addon() {
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
  echo "Installed todo.txt $1 addon"
}
fileaddon() {
  curl -so "$ACTION_DIR/$1" "$2"
  chmod +x "$ACTION_DIR/$1"
  echo "Installed todo.txt $1 addon"
}

addon graph https://github.com/timpulver/todo.txt-graph.git
addon due https://github.com/rebeccamorgan/due.git
addon pom https://github.com/metalelf0/pomodori-todo.txt
addon outline https://github.com/samuelsnyder/outline-todo.txt
addon wp https://github.com/rameshg87/todo.txt-weekly-planner
addon recur https://github.com/paulroub/todo.txt-recurring-tasks
fileaddon futureTasks https://raw.githubusercontent.com/FND/todo.txt-cli/extensions/futureTasks
fileaddon nav https://raw.githubusercontent.com/doegox/todo.txt-cli/extras/todo.actions.d/nav
fileaddon donow https://raw.githubusercontent.com/clobrano/todo.txt-cli/master/todo.actions.d/donow

