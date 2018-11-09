#!/usr/bin/env sh
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  echo "Creating an ssh key"
  ssh-keygen -b 4096 ~/.id_rsa -N ""
fi


if [ -z "$STRAP_GITHUB_USER" ]; then
  STRAP_GITHUB_USER="$(git config github.user)"
fi
printf "GitHub username? (default: $STRAP_GITHUB_USER) "
read -r USER
if [ "$USER" = "" ]
then
  USER="$STRAP_GITHUB_USER"
fi

pub="$(cat ~/.ssh/id_rsa.pub)"
if ! curl -sq "https://github.com/$USER.keys" | grep "$pub" > /dev/null; then
  echo "Add your SSH key to GitHub.com!"
  echo "The public key is in your clipboard"
  pbcopy < ~/.ssh/id_rsa.pub
  open https://github.com/settings/ssh/new
fi

if ! grep "Host github.com" ~/.ssh/config > /dev/null; then 
  cat <<EOF >> ~/.ssh/config
Host github.com
  User git
  IdentityFile ~/.ssh/id_rsa
EOF
fi

ssh github.com
