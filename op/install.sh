#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" $0

mkdir -p ~/.op
chmod 700 ~/.op
export OP_SESSION_my=""
if [ -f ~/.op/session ]; then
  # shellcheck disable=SC1091
  source ~/.op/session
fi
if ! op confirm --all 2>/dev/null; then
  read -p "1Password email? " OP_EMAIL
  op signin my ${OP_EMAIL} > ~/.op/session
fi
