#!/usr/bin/env sh
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  echo "Creating an ssh key"
  ssh-keygen -q -b 4096 -N "" -f ~/.ssh/id_rsa
fi


if [ -z "$STRAP_GITHUB_USER" ]; then
  STRAP_GITHUB_USER="$(git config github.user)"
fi
GHUSER="${STRAP_GITHUB_USER:-keithamus}"

pub="$(ssh-keygen -y -f ~/.ssh/id_rsa | cut -d ' ' -f 1,2)"
url="https://github.com/settings/ssh/new"
if ! curl -sq "https://github.com/$GHUSER.keys" | grep "$pub" > /dev/null; then
  echo "Add your SSH key to GitHub.com!"
  if [ "$(uname -s)" = "Darwin" ]
  then
    echo "$pub" | pbcopy
    echo "The public key is in your clipboard"
    open "$url"
  elif [ "$(uname -s)" = "Linux" -a "$GDMSESSION" = "pop" ]
  then
    echo "$pub" | xclip -selection clipboard
    echo "The public key is in your clipboard"
    gio open "$url"
  else
    echo "$pub"
    echo "Copy the contents of this public key, and visit $url"
  fi
fi

if ! grep "Host github.com" ~/.ssh/config > /dev/null; then 
  cat <<EOF >> ~/.ssh/config
Host github.com
  User git
  IdentityFile ~/.ssh/id_rsa
EOF
fi

ssh github.com
